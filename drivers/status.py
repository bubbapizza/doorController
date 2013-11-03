#!/usr/bin/python
#
# This file defines all the door controller parts and their statuses

######## DOOR CONTROLLER PROTOCOL #########

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
CMD_STATUS_ALL = 's'
CMD_STATUS_RED = '1'
CMD_STATUS_GREEN = '2'
CMD_STATUS_DOOR = '3'
CMD_STATUS_RFID = '4'

# These are the message strings received from the status command.
NUM_STATUS_POLLABLE = 4

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


# These are the pollable parts of the door controller.
GREEN = "greenLED"
RED = "redLED"
DOOR = "door"
RFID = "rfid"

# These are status codes that can be used for the parts.
LOCKED = "locked"
UNLOCKED = "unlocked"
ON = True
OFF = False
ENABLED = "enabled"
DISABLED = "disabled"


