#!/usr/bin/python
#
# This program controls a door lock via a swipe card.  At the moment, 
# all it does is toggle the door lock on or off whenever an RFID card
# of any sort is swiped.
#

#### CONSTANTS ####

# Set the pause delay (in seconds) between successful card reads.
RFID_READ_DELAY = 2



import time
from drivers.arduino import *
      
# Open communications with the door controller.
ctl = controller("/dev/ttyACM0", 2400)

# Enable RFID, lock the door, set up RFID reader lights.
ctl.rfidON()
ctl.lockDoor()
ctl.greenOFF()
ctl.redON()

# Enter the main control loop.
While True:

   # Check the door controller to see if there's an RFID card that
   # was swiped. 
   card = readRFID()

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
