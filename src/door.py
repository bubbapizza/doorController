#!/usr/bin/python
#
# This module is an API for controlling a swipe card and door lock.
#

# CONSTANTS

# These are the types of hardware the door controller can interface
# with.
#
HARDWARE_DUMMY = "dummy"
HARDWARE_ARDUINO = "arduino"
HARDWARE_RPI = "rpi"

import pySerial

class API:

   def __init__(self, hardware=HARDWARE_ARDUINO):
      
       

      
