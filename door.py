#!/usr/bin/python
#
#
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
# 

#
#  This program is a simple rfid door controller.  It provides a serial 
#  interface for reading RFID cards and controlling a magnetic door lock,
#  a green led, a red led and a piezo buzzer.
# 
# This program controls a door lock via a swipe card.  At the moment, 
# all it does is toggle the door lock on or off whenever an RFID card
# of any sort is swiped.
#

#### CONSTANTS ####

# Set the pause delay (in seconds) between successful card reads.
RFID_READ_DELAY = 0



import time
from drivers.arduino import *
      
# Open communications with the door controller.
ctl = controller("/dev/ttyACM1", 115200)

# Enable RFID, lock the door, set up RFID reader lights.
ctl.rfidON()
ctl.lockDoor()
ctl.greenOFF()
ctl.redON()

# Enter the main control loop.
while True:

   # Check the door controller to see if there's an RFID card that
   # was swiped. 
   card = ctl.readRFID()

   if card:
      
      #
      # TODO: Put some code here to validate the card
      #
      print card
      ctl.ringBell()

      # Flash the green light to let the user know the door status is
      # changing.
      ctl.redOFF() 
      ctl.greenON()

      # Toggle the door lock status.
      status = ctl.statusDoor()
      if status == LOCKED:
         ctl.unlockDoor()

      elif status == UNLOCKED:
         ctl.lockDoor()

      # Wait a bit before trying to read the card again.
      time.sleep(RFID_READ_DELAY)

      # Set the lights back to normal to let the user know they can
      # retry a card swipe.
      ctl.greenOFF()
      ctl.redON()
