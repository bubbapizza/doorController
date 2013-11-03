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
# This is the base class for creating a door controller device driver.
# It can read RFID cards, unlock/locking a door and controlling some 
# lights and a buzzer for indicating swipe card status.
#


# Import all door controller status codes, values and messages.
from status import *


####### EXCEPTIONS #######
class Error(Exception):
   """Base class for exceptions in this module."""
   pass

class StatusError(Error):
   """Exception raised when the controller status is bad/incomplete.

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

      self.device = {
         GREEN : OFF, 
         RED : OFF,
         DOOR : LOCKED,
         RFID : ENABLED
      }
      print("Controller initialized!!")


   ##### BASE METHODS #####

   def readRFID(self):
      """This routine returns the RFID card value if one happens to 
      be swiped.  Normally, this routine would block on the
      hardware-specific _readRFID method."""

      card = None
      if self.device[RFID]:
         card = self._readRFID()

      return card

   
   def status(self, subdevice=None):
      """Return the status of all subdevices (RED, GREEN, DOOR, RFID) or
      a specific device."""

      # Return the status of a specific subdevice.
      if subdevice:
         if subdevice == RED:
            return self._sendCMD(CMD_STATUS_RED)
         if subdevice == GREEN:
            return self._sendCMD(CMD_STATUS_GREEN)
         if subdevice == DOOR:
            return self._sendCMD(CMD_STATUS_DOOR)
         if subdevice == RFID:
            return self._sendCMD(CMD_STATUS_RFID)
            
      # Return the status of all devices.
      else:
         return self._sendCMD(CMD_STATUS_ALL)
      

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



   ##### OVERRIDE THESE HARDWARE SPECIFIC METHODS #####

   def _readRFID(self):
      """Return the card number of the most recently read RFID card."""

      print("Reading RFID swipe card...")

      return ""


   def _sendCMD(self, cmd):
      """Internally used to for controlling pins and returning 
      status codes."""

      print("Sending command:", cmd)


      #
      # Return the status of all pollable parts.
      #
      if cmd == CMD_STATUS_ALL:
         return self.device
      if cmd == CMD_STATUS_RED:
         return self.device[RED]
      if cmd == CMD_STATUS_GREEN:
         return self.device[GREEN]
      if cmd == CMD_STATUS_DOOR:
         return self.device[DOOR]
      if cmd == CMD_STATUS_RFID:
         return self.device[RFID]
      
      #
      # Change the red LED status.
      #
      elif cmd == CMD_RED_ON:
         self.device[RED] = ON
      elif cmd == CMD_RED_OFF:
         self.device[RED] = OFF

      #
      # Change the Green LED status.
      #
      elif cmd == CMD_GREEN_ON:
         self.device[GREEN] = ON
      elif cmd == CMD_GREEN_OFF:
         self.device[GREEN] = OFF

      #
      # Change the door lock status.
      #
      elif cmd == CMD_DOOR_LOCK:
         self.device[DOOR] = LOCKED
      elif cmd == CMD_DOOR_UNLOCK:
         self.device[DOOR] = UNLOCKED

      #
      # Change the door lock status.
      #
      elif cmd == CMD_RFID_ENABLE:
         self.device[RFID] = ENABLED
      elif cmd == CMD_RFID_DISABLE:
         self.device[RFID] = DISABLED

      #
      # Ring the piezo buzzer.
      # 
      elif cmd == BELL:
         print(MSG_BELL)
