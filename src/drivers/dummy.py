#!/usr/bin/python

# This is a dummy device driver for reading an RFID card, 
# unlocking/locking a door and controlling some lights and a buzzer
# to indicate swipe card status.
#
# Shawn Wilson
# Oct 13, 2013
#

# When the random RFID simulator is turned on, set the min/max 
# number of seconds to wait in between simulated card swipes.
RANDOM_RFID_MIN_INTERVAL = 3
RANDOM_RFID_MAX_INTERVAL = 10

# This is the timeout period for waiting for an RFID card to come in.
RFID_TIMOUT = 5


class controller:
   """This is a dummy device driver for door controller hardware."""


   def __init__(self):
      """Initializing the dummy controller turns on the red LED on
      the swipe card unit, turns the green LED off, locks the door,
      and starts reading RFID cards."""

      self.red = True
      self.green = False
      self.doorOpen = False
      self.rfid = True
      

   def lockDoor(self):
      """Lock the door."""
      self.doorOpen = False


   def unlockDoor(self):
      """Unlock the door."""
      self.doorOpen = True


   def greenON(self):
      """Turn the green LED on."""
      self.green = True

   def greenOFF(self):
      """Turn the green LED off."""
      self.green = False


   def redON(self):
      """Turn the red LED on."""
      self.red = True

   def redOFF(self):
      """Turn the red LED off."""
      self.red = False


   def ringBell(self):
      """Ring a buzzer."""
      print "BUZZ!!!"

   
   def rfidON(self):
      """Enable reading of RFID cards."""
      self.rfid = True

   def rfidOFF(self):
      """Disable reading of RFID cards."""
      self.rfid = False


   def readRFID(self, simulate=False, timeout=RFID_TIMEOUT)
      """Read in RFID cards.  If simulate is True, then we just randomly
      return some RFID card numbers every now and then.  If no cards
      are returned within RFID_TIMEOUT period, then we just return
      a null."""
   
