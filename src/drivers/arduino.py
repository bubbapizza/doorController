#!/usr/bin/python

# This is a device driver for talking to an arduino running the 
# doorController sketch.  It can read RFID cards, unlock/locking 
# a door and controlling some lights and a buzzer for indicating
# swipe card status.
#
# Shawn Wilson
# Oct 14, 2013
#

# This is the timeout period for waiting for an RFID card to come in.
SERIAL_TIMOUT = 1

# These are dictionary keys used for storing device statuses.
DOOR_LOCKED = "door"
GREEN_ON = "greenLED"
RED_ON = "redLED"
RFID_ENABLED = "rfid"



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

# Thse are the message strings received from the status command.
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


import serial


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
      self.conn.open()

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
      while line:
         if line == MSG_LOCK:
            result[DOOR_LOCKED] = True

         elif line == MSG_UNLOCK:
            result[DOOR_LOCKED] = False

         elif line == MSG_GREEN_ON:
            result[GREEN_ON] = True

         elif line == MSG_GREEN_OFF:
            result[GREEN_ON] = False

         elif line == MSG_RED_ON:
            result[RED_ON] = True

         elif line == MSG_RED_OFF:
            result[RED_ON] = False

         elif line == MSG_RFID_ENABLED:
            result[RFID_ENABLED] = True

         elif line == MSG_RFID_DISABLED:
            result[RFID_ENABLED] = False
            
         # Read in the next status line.
         line = self.conn.readline().strip()



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
      """Wait for an RFID swipe card.  If simulate is True, then we 
      just randomly return some RFID card numbers every now and then.  
      If no cards are returned within RFID_TIMEOUT period, then we just 
      return a None."""

   

class rfidSimulator(threading.Thread):
   """This is going to be a thread class that simulates people making 
   swipes to an RFID card reader.  It just returns random RFID card
   numbers anywhere from RANDOM_RFID_MIN_INTERVAL to
   RANDOM_RFID_MAX_INTERVAL seconds."""

   def __init__(self, minTime=None, maxTime=None):
      """Initialize the simulator settings."""
   
      self.minTime = RANDOM_RFID_MIN_INTERVAL if not minTime else minTime
      self.maxTime = RANDOM_RFID_MAX_INTERVAL if not maxTime else maxTime

   def run(self):
      """Send some random RFID card numbers."""
