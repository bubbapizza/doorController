#!/usr/bin/python
#
# This file defines all the door controller parts and their statuses

######## DOOR CONTROLLER PROTOCOL #########

# These are all the commands you can send to the door controller.
CMD_DOOR_UNLOCK = 'd'
CMD_DOOR_LOCK = 'D'
CMD_GREEN_OFF = 'g'
CMD_GREEN_ON = 'G'
CMD_RED_OFF = 'r'
CMD_RED_ON = 'R'
CMD_BELL = 'b'
CMD_RFID_DISABLE = 'f'
CMD_RFID_ENABLE = 'F'
CMD_STATUS_ALL = 's'
CMD_STATUS_RED = '1'
CMD_STATUS_GREEN = '2'
CMD_STATUS_DOOR = '3'
CMD_STATUS_RFID = '4'

# These are subdevices that have changeable states.
GREEN = "greenLED"
RED = "redLED"
DOOR = "door"
RFID = "rfid"

# These are state codes that can be used for the subdevices.
LOCKED = "locked"
UNLOCKED = "unlocked"
ON = True
OFF = False
ENABLED = "enabled"
DISABLED = "disabled"


