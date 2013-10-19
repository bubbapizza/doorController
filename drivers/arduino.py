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

# This is the timeout period for waiting for an RFID card to come in.
SERIAL_TIMEOUT = 5


######## ARDUINO SERIAL PROTOCOL #########

# These are all the commands you can send to the arduino.
CMD_DOOR_UNLOCK = 'd'
CMD_DOOR_LOCK = 'D'
CMD_GREEN_OFF = 'g'
CMD_GREEN_ON = 'G'
CMD_RED_OFF = 'r'
CMD_RED_ON = 'R'
CMD_BELL = 'b'
CMD_RFID_DISABLE = 'f'
CMD_RFID_ENABLE = 'F'
CMD_STATUS = 's'

# These are the message strings received from the status command.
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


import serial
from status import *

####### EXCEPTIONS #######
class Error(Exception):
   """Base class for exceptions in this module."""
   pass

class StatusError(Error):
   """Exception raised when the arduino status is bad/incomplete.

   Attributes:
      status -- the bad/incomplete status dictionary"""

   def __init__(self, status):
      self.status = status
   

####### CONTROLLER OBJECT #######

class controller:
   """This is a device driver for arduino-based door controller hardware.
   The arduino has to be running the doorController.ino sketch that comes
   with this package."""


   def __init__(self, port="/dev/ttyACM0", baudrate=2400):
      """Initializing the controller turns on the red LED on
      the swipe card unit, turns the green LED off, locks the door,
      and starts reading RFID cards."""

      self.conn = serial.Serial(
         port=port, 
         baudrate=baudrate,
         parity=serial.PARITY_NONE,
         bytesize=serial.EIGHTBITS,
         stopbits=serial.STOPBITS_ONE,
         timeout=SERIAL_TIMEOUT) 
      self.open()

   def open(self):
      """Open the serial connection to the arduino and flush anything
      in the input buffer."""
      self.conn.open()
      self.conn.flushInput()

   def close(self):
      """Close the serial connection to the arduino."""
      self.conn.close()

   def _sendCMD(self, cmd):
      """Internally used to send a command over the serial port."""
      self.conn.write(cmd)

   def _readStatus(self):
      """Get the current status of the door controller."""
      self.conn.flushInput() 
      self._sendCMD(CMD_STATUS)

      status = {}

      # Go through every status line and build the dictionary of 
      # statuses.
      line = self.conn.readline().strip()
      print line
      while line:
         if line == MSG_LOCK:
            status[DOOR] = LOCKED

         elif line == MSG_UNLOCK:
            status[DOOR] = UNLOCKED

         elif line == MSG_GREEN_ON:
            status[GREEN] = ON

         elif line == MSG_GREEN_OFF:
            status[GREEN] = OFF

         elif line == MSG_RED_ON:
            status[RED] = ON

         elif line == MSG_RED_OFF:
            status[RED] = OFF

         elif line == MSG_RFID_ENABLED:
            status[RFID] = ENABLED

         elif line == MSG_RFID_DISABLED:
            status[RFID] = DISABLED
            
         # Read in the next status line.
         line = self.conn.readline().strip()

      # Check to make sure we're not missing a status.  If we are, then
      # raise an error because there's something wrong w/ serial
      # communications somewhere.
      if (DOOR in status) and (GREEN in status) and \
         (RED in status) and (RFID in status):
         return status
      else:
         raise StatusError(status)


   def statusRFID(self):
      """Returns whether or not RFID reading is enabled.  It returns the
      values ENABLED or DISABLED."""

      status = self._readStatus()
      return status[RFID]
      
   def statusDoor(self):
      """Returns whether the door is LOCKED or UNLOCKED."""

      status = self._readStatus()
      return status[DOOR]


   #### COMMANDS ####

   def lockDoor(self):
      """Lock the door."""
      self._sendCMD(CMD_DOOR_LOCK)

   def unlockDoor(self):
      """Unlock the door."""
      self._sendCMD(CMD_DOOR_UNLOCK)


   def greenON(self):
      """Turn the green LED on."""
      self._sendCMD(CMD_GREEN_ON)

   def greenOFF(self):
      """Turn the green LED off."""
      self._sendCMD(CMD_GREEN_OFF)


   def redON(self):
      """Turn the red LED on."""
      self._sendCMD(CMD_RED_ON)

   def redOFF(self):
      """Turn the red LED off."""
      self._sendCMD(CMD_RED_OFF)


   def ringBell(self):
      """Ring a buzzer."""
      self._sendCMD(CMD_BELL)

   
   def rfidON(self):
      """Enable reading of RFID cards."""
      self._sendCMD(CMD_RFID_ENABLE)

   def rfidOFF(self):
      """Disable reading of RFID cards."""
      self._sendCMD(CMD_RFID_DISABLE)


   def readRFID(self):
      """Wait for an RFID swipe card.  If no card is available after
      SERIAL_TIMEOUT, then it returns a None value"""

      self.conn.flushInput()
      result = None

      # Read all the input we have and as soon as we hit a MSG_CARD
      # string, flush the input buffer and return the card number.
      #
      line = self.conn.readline().strip()
      while line:
         if line.startswith(MSG_CARD):
            result = line.lstrip(MSG_CARD)
            break

         line = self.conn.readline().strip()
      
      return result
