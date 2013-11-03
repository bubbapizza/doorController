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
# This is a device driver for a raspberry pi door controller.  It 
# inherits all the base driver methods and just overrides the hardware
# specific methods for talking to the RPi.
#


from RPi import *
from status import *
import os

####### CONSTANTS ######

PIN_RED = 18
PIN_GREEN = 16
PIN_DOOR = 12
PIN_BELL = 22

# RFID enable is not enabled yet.
PIN_RFID = -1 
 
# This is the file that we poll for RFID card values.
RFID_CARD_FILE = "/tmp/rfidCard0"


####### CONTROLLER OBJECT #######

class controller(base):
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
   
      # Initialize the door controller state by calling the base
      # __init__ routine.
      base.__init__(self)


   def _readRFID(self):
      """Return the card number of the most recently read RFID card."""

      # Check the file size of the RFID file.  If it's not empty, 
      # then just return whatever the contents are of the first line.
      #
      if os.path.getsize(RFID_CARD_FILE) > 0:
         f = open(RFID_CARD_FILE)
         returnVal = f.readline().strip()
         f.close()

         # Blank the file now that we've read it.
         f = open(RFID_CARD_FILE)
         f.write("")
         f.close()

         return returnVal

      return ""


   def _sendCMD(self, cmd):
      """Internally used for controlling RPi pins and returning 
      status codes."""

      #
      # Return the status of all/any pollable subdevices.  When a status
      # code is requested, we check the actual hardware value to see what 
      # the state is, then modify the internal _state dictionary 
      # accoringly.  
      #
      # This way, when we call the base superclass at the bottom, the 
      # status will get returned correctly. 
      #
      if cmd == CMD_STATUS_ALL:
         if GPIO.input(PIN_RED) == GPIO.HIGH:
            self._state[RED] = ON
         elif GPIO.input(PIN_RED) == GPIO.LOW:
            self._state[RED] = OFF
         
         if GPIO.input(PIN_GREEN) == GPIO.HIGH:
            self._state[GREEN] = ON
         elif GPIO.input(PIN_GREEN) == GPIO.LOW:
            self._state[GREEN] = OFF

         if GPIO.input(PIN_DOOR) == GPIO.HIGH:
            self._state[DOOR] = LOCKED
         elif GPIO.input(PIN_DOOR) == GPIO.LOW:
            self._state[DOOR] = UNLOCKED
         
         if GPIO.input(PIN_RFID) == GPIO.HIGH:
            self._state[RFID] = ENABLED
         elif GPIO.input(PIN_RFID) == GPIO.LOW:
            self._state[RFID] = DISABLED


      elif cmd == CMD_STATUS_RED:
         if GPIO.input(PIN_RED) == GPIO.HIGH:
            self._state[RED] = ON
         elif GPIO.input(PIN_RED) == GPIO.LOW:
            self._state[RED] = OFF

      elif cmd == CMD_STATUS_GREEN:
         if GPIO.input(PIN_GREEN) == GPIO.HIGH:
            self._state[GREEN] = ON
         elif GPIO.input(PIN_GREEN) == GPIO.LOW:
            self._state[GREEN] = OFF

      elif cmd == CMD_STATUS_DOOR:
         if GPIO.input(PIN_DOOR) == GPIO.HIGH:
            self._state[DOOR] = LOCKED
         elif GPIO.input(PIN_DOOR) == GPIO.LOW:
            self._state[DOOR] = UNLOCKED

      elif cmd == CMD_STATUS_RFID:
         if GPIO.input(PIN_RFID) == GPIO.HIGH:
            self._state[RFID] = ENABLED
         elif GPIO.input(PIN_RFID) == GPIO.LOW:
            self._state[RFID] = DISABLED
      
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
         # Still have to figure out how to buzz a piezo with an RPi
         pass


      # Call the base controller class which handles setting and
      # returning of the internal _state values.
      base._sendCMD(self, cmd)
