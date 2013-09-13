/************
 *        Copyright (C) 2013 Shawn Wilson
 *        shawn@ch2a.ca
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * 
 *  This program is a simple rfid door controller.  It provides a serial 
 *  interface for reading RFID cards and controlling a magnetic door lock.
 *
 *  Pins 2 & 3 read incoming RFID data using the Wiegand protocol.  The
 *  Wiegand protocol is an ancient de-facto standard for door locks, etc.
 *  DOOR_LOCK_PIN controls the 
 *
 *************/

#include "Wiegand.h"

/* CONSTANTS */
#define VERSION 0.1

/* This is the pin that triggers the door lock on and off. */
#define DOOR_LOCK_PIN 9

/* Set up commands triggered by incoming characters over serial. */
#define CMD_LOCK 'l'
#define CMD_UNLOCK 'u'

/* Set up message strings to be sent back over serial. */
#define MSG_LOCK "DOOR LOCKED"
#define MSG_UNLOCK "DOOR UNLOCKED"


/* VARIABLES */
WIEGAND wg;



/**********
 *  Door lock/unlock routines
 **********/
void lockDoor() {
   digitalWrite(DOOR_LOCK_PIN, HIGH);
} /* endfunction */

void unlockDoor() {
   digitalWrite(DOOR_LOCK_PIN, LOW);
} /* endfunction */


/**********
 *  Startup routine
 **********/
void setup() {
   Serial.begin(9600);
   pinMode(DOOR_LOCK_PIN, OUTPUT);  

   /* Start listening for RFID tags and lock the door. */
   wg.begin();
   lockDoor();

   Serial.println("Door controller initialized.");
} /* endfunction */


/**********
 *  Main event loop
 **********/
void loop() {

   char inChr;

   /* See if we got any info that came in over the Wiegand protocol. 
      i.e.  See if a card was swiped. */
   if (wg.available()) {

      /* When we get a card, print the card info in hex followed
         by the card type (8, 26 or 34). */
      Serial.print("CARD ");
      Serial.print(wg.getCode(), HEX);
      Serial.print(" ");
      Serial.println(wg.getWiegandType());    

   /* Check to see if we have any serial commands that came in. */
   } else if (Serial.available() > 0) {
         
         inChr = Serial.read();

         /* 
          *  Execute any one-character commands that came in on the
          *  serial port.
          */
         if (inChr == CMD_UNLOCK) {
            unlockDoor();
            Serial.println(MSG_UNLOCK);

         } else if (inChr == CMD_LOCK) {
            lockDoor();
            Serial.println(MSG_LOCK);
         } /* endif */
   } /* endif */

} /* endfunction */
