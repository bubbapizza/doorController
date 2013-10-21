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


from RPi import *
from status import *

####### CONSTANTS ######

# This is the file that we poll for RFID card values.
RFID_CARD_FILE = "/tmp/rfidCard0"


####### EXCEPTIONS #######
class Error(Exception):
   """Base class for exceptions in this module."""
   pass

class StatusError(Error):
   """Exception raised when the RPi status is bad/incomplete.

   Attributes:
      status -- the bad/incomplete status dictionary"""

   def __init__(self, status):
      self.status = status
   

####### CONTROLLER OBJECT #######

class controller:
   """This is a device driver for arduino-based door controller hardware.
   The arduino has to be running the doorController.ino sketch that comes
   with this package."""


   def __init__(self, cardFile=None):
      """Initializing the controller turns on the red LED on
      the swipe card unit, turns the green LED off, locks the door,
      and starts reading RFID cards."""

      # Set the default card file.
      if cardFile == None:
         self.cardFile = RFID_CARD_FILE


      # Set pin modes.
      GPIO.setmode(GPIO.BOARD)

      GPIO.setup(PIN_RED, GPIO.OUT)
      GPIO.setup(PIN_GREEN, GPIO.OUT)
      GPIO.setup(PIN_DOOR, GPIO.OUT)
      GPIO.setup(PIN_BELL, GPIO.OUT)
      GPIO.setup(PIN_RFID, GPIO.OUT)
   
   def _sendCMD(self, cmd):
      """Internally used to for controlling pins and returning 
      status codes."""

      returnVal = None

      #
      # Return the status of all pollable parts.
      #
      if cmd == CMD_STATUS:
         returnVal = []
         if GPIO.input(PIN_RED) == GPIO.HIGH:
            returnVal.append(MSG_RED_ON)
         elif GPIO.input(PIN_RED) == GPIO.LOW:
            returnVal.append(MSG_RED_OFF)
         
         if GPIO.input(PIN_GREEN) == GPIO.HIGH:
            returnVal.append(MSG_GREEN_ON)
         elif GPIO.input(PIN_GREEN) == GPIO.LOW:
            returnVal.append(MSG_GREEN_OFF)

         if GPIO.input(PIN_DOOR) == GPIO.HIGH:
            returnVal.append(MSG_LOCK)
         elif GPIO.input(PIN_DOOR) == GPIO.LOW:
            returnVal.append(MSG_UNLOCK)
         
         if GPIO.input(PIN_RFID) == GPIO.HIGH:
            returnVal.append(MSG_RFID_ENABLED)
         elif GPIO.input(PIN_RFID) == GPIO.LOW:
            returnVal.append(MSG_RFID_DISABLED)

         if len(returnVal) != NUM_STATUS_POLLABLE:
            raise StatusError

      
      #
      # Change the red LED status.
      #
      elif cmd == CMD_RED_ON:
         GPIO.output(PIN_RED, GPIO.HIGH)
      elif cmd == CMD_RED_OFF:
         GPIO.output(PIN_RED, GPIO.LOW)

      #
      # Change the Green LED status.
      #
      elif cmd == CMD_GREEN_ON:
         GPIO.output(PIN_GREEN, GPIO.HIGH)
      elif cmd == CMD_GREEN_OFF:
         GPIO.output(PIN_GREEN, GPIO.LOW)

      #
      # Change the door lock status.
      #
      elif cmd == CMD_DOOR_LOCK:
         GPIO.output(PIN_DOOR, GPIO.HIGH)
      elif cmd == CMD_DOOR_UNLOCK:
         GPIO.output(PIN_DOOR, GPIO.LOW)

      #
      # Change the door lock status.
      #
      elif cmd == CMD_RFID_ENABLE:
         GPIO.output(PIN_RFID, GPIO.HIGH)
      elif cmd == CMD_RFID_DISABLE:
         GPIO.output(PIN_RFID, GPIO.LOW)

      #
      # Ring the piezo buzzer.
      # 
      elif cmd == BELL:
         print MSG_BELL


      return returnVal


   def _readStatus(self):
      """Get the current status of the door controller."""
      self.conn.flushInput() 
      status = self._sendCMD(CMD_STATUS)


      # Go through every status line and build the dictionary of 
      # statuses.
      for line in status:
         print line
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
            
      return status


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
