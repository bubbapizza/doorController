#!/usr/bin/python

#        Copyright (C) 2013 Shawn Wilson
#        shawn@ch2a.ca
#        
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.

#
# This is a device driver for talking to an arduino running the 
# doorController sketch.  It can read RFID cards, unlock/locking 
# a door and controlling some lights and a buzzer for indicating
# swipe card status.
#
# Shawn Wilson
# Oct 14, 2013
#

import base
import serial
from status import *


######## CONSTANTS #########

# This is the timeout period for waiting for an RFID card to come in.
SERIAL_TIMEOUT = 1

# These are possible messages returned from arduino door controller.
MSG_STATUS_HEADER = "===== Door Controller Status ======"
MSG_STATUS_FOOTER = "==================================="
MSG_LOCK = "DOOR LOCKED"
MSG_UNLOCK = "DOOR UNLOCKED"
MSG_GREEN_OFF = "GREEN LED OFF"
MSG_GREEN_ON = "GREEN LED ON"
MSG_RED_OFF = "RED LED OFF"
MSG_RED_ON = "RED LED ON"
MSG_BELL = "BELL RING"
MSG_RFID_ENABLED = "RFID READER ENABLED"
MSG_RFID_DISABLED = "RFID READER DISABLED"

# This is the string that precedes an RFID card number
MSG_CARD = "CARD "



####### CONTROLLER OBJECT #######

class controller(base.controller):
   """This is a device driver for arduino-based door controller hardware.
   The arduino has to be running the doorController.ino sketch that comes
   with this package."""


   def __init__(self, port="/dev/ttyACM0", baudrate=2400):
      """Initializing the controller turns on the red LED on
      the swipe card unit, turns the green LED off, locks the door,
      and starts reading RFID cards."""

      self._conn = serial.Serial(
         port=port, 
         baudrate=baudrate,
         parity=serial.PARITY_NONE,
         bytesize=serial.EIGHTBITS,
         stopbits=serial.STOPBITS_ONE,
         timeout=SERIAL_TIMEOUT) 
      self._open()

      # Initialize internal state variables, etc.
      base.controller.__init__(self)


   def _open(self):
      """Open the serial connection to the arduino and flush anything
      in the input buffer."""
      self._conn.open()
      self._conn.flushInput()

   def _close(self):
      """Close the serial connection to the arduino."""
      self._conn.close()


   def _readRFID(self):
      """Wait for an RFID swipe card.  If no card is available after
      SERIAL_TIMEOUT, then it returns a None value"""

      # Flush the serial input in case it's already full of RFID cards.
      self._conn.flushInput()

      #
      # Read all the input we have and as soon as we hit a MSG_CARD
      # string, flush the input buffer and return the card number.
      #
      result = None
      line = self._conn.readline().strip()
      while line:
         if line.startswith(MSG_CARD):
            result = line.lstrip(MSG_CARD)
            break

         line = self._conn.readline().strip()
      
      return result


   def _sendCMD(self, cmd):
      """Internally used to send a command over the serial port."""

      # Flush existing input so we don't accidentally read any RFID
      # cards, then send the command to the arduino.
      self._conn.flushInput() 
      self._conn.write(cmd)

      #
      # For statuses, read in what the arduino sent us back and change
      # the internal state dictionary accordingly.
      #
      if cmd == CMD_STATUS_ALL:
         line = self._conn.readline().strip()
         print line
         while line:
            if line == MSG_LOCK:
               self._status[DOOR] = LOCKED
   
            elif line == MSG_UNLOCK:
               self._status[DOOR] = UNLOCKED
   
            elif line == MSG_GREEN_ON:
               self._status[GREEN] = ON
   
            elif line == MSG_GREEN_OFF:
               self._status[GREEN] = OFF
   
            elif line == MSG_RED_ON:
               self._status[RED] = ON
   
            elif line == MSG_RED_OFF:
               self._status[RED] = OFF
   
            elif line == MSG_RFID_ENABLED:
               self._status[RFID] = ENABLED
   
            elif line == MSG_RFID_DISABLED:
               self._status[RFID] = DISABLED
               
            # Read in the next status line.
            line = self._conn.readline().strip()

      elif cmd == CMD_STATUS_RED:
         line = self._conn.readline().strip()
         elif line == MSG_RED_ON:
            self._status[RED] = ON
         elif line == MSG_RED_OFF:
            self._status[RED] = OFF
         
      elif cmd == CMD_STATUS_GREEN:
         line = self._conn.readline().strip()
         elif line == MSG_GREEN_ON:
            self._status[GREEN] = ON
         elif line == MSG_GREEN_OFF:
            self._status[GREEN] = OFF

      elif cmd == CMD_STATUS_DOOR:
         line = self._conn.readline().strip()
         elif line == MSG_LOCK:
            self._status[DOOR] = LOCKED
         elif line == MSG_UNLOCK:
            self._status[DOOR] = UNLOCKED
         
      elif cmd == CMD_STATUS_RFID:
         line = self._conn.readline().strip()
         elif line == MSG_RFID_ENABLED:
            self._status[DOOR] = ENABLED
         elif line == MSG_RFID_DISABLED:
            self._status[DOOR] = DISABLED

      # Call the base class to handle state variables.
      base.controller._sendCMD(self, cmd)


