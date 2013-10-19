#!/usr/bin/env python
#
# hf_door1.py
# 20131008
# RPi board v2
# 
#
#
#     +------------------------------------------
#     |          1 1 1 1 1 2 2 2 2 
#     |  2 4 6 8 0 2 4 6 8 0 2 4 6
#     |  * * * * * * * * * * * * *
#     |                        
#     |  * * * * * * * * * * * * *
#     |  1 3 5 7 9 1 3 5 7 9 1 3 5
#     |            1 1 1 1 1 2 2 2
#     |                             
#
# NOTES: pins 2, 4 = +5V, 
#        pins 1    = +3.3V
#        pin  6    = GND
#
# pins 16. and 18. of the header are set to OUTPUT
# pins 11. and 12. of the header are used as INPUT
#
#
from time import sleep
# get the GPIO Library
import RPi.GPIO as GPIO

# setup some names references to the LED's and buttons
# red         = pin 18
# green        = pin 16

# using an list to hold the led numbers
leds = [13, 15, 16, 18]
# the input buttons
UP = 12
DN = 11

# setup the pins as output and input as needed
# choose pin numbering scheme: physical pin layout:
GPIO.setmode( GPIO.BOARD )
GPIO.setwarnings( False )       # disable the spurious warning messages
# looping over the list 
for n in leds:
    GPIO.setup(n, GPIO.OUT)

GPIO.setup(UP, GPIO.IN)
GPIO.setup(DN, GPIO.IN)
# turn off all but the blue LED
GPIO.output(leds[3], True)
GPIO.output(leds[2], True)
GPIO.output(leds[1], True)
GPIO.output(leds[0], False)

#state trackers
level = 0
oldlevel = level

while 1:
    GPIO.output(16, True )
    GPIO.output(18, False )
    # sleep for a bit 
    sleep(1)
    GPIO.output(16, False )
    GPIO.output(18, True )
    # sleep for a bit 
    sleep(1)
    #
    # look for  keypress:  essentially we need to hold the key for 2 seconds
    # due to the 'sleep(1)' commands
    # 
    Kpress = GPIO.input( DN )
    if ( Kpress == 0 ):
       print( "Key Pressed" )

GPIO.cleanup()
