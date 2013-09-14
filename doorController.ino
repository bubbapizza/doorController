/************
 *
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
 * 
 *  This program is a simple rfid door controller.  It provides a serial 
 *  interface for reading RFID cards and controlling a magnetic door lock,
 *  a green led, a red led and a piezo buzzer.
 * 
 *************/

#include <SoftwareSerial.h>


/**** CONSTANTS ****/

#define VERSION 0.2

/* Set up pins for lights, buzzer(s), door lock, and RFID enable. */
#define GREEN_LED_PIN 4
#define RED_LED_PIN 5
#define BELL_PIN 6
#define DOOR_LOCK_PIN 7
#define RFID_ENABLE_PIN 2

/* The Parallax RFID reader is a read-only device, but we still have
   to set up two pins for the software serial driver.  The SOUT pin
   of the Parallax reader gets connected to the Rx pin and the 
   Tx pin is unused. */
#define RFID_RX_PIN 8
#define RFID_TX_PIN 9

/* When the RFID reader detects a card, it sends 12 bytes over the 
   serial line.  The first byte is 0x0A and the last byte is 0x0A. 
   Here, we just set up some constants for those values. */
#define RFID_NUM_BYTES 10
#define RFID_START_BYTE 10
#define RFID_STOP_BYTE 13


/* Set up commands triggered by incoming characters over serial. */
#define CMD_LOCK 'l'
#define CMD_UNLOCK 'u'
#define CMD_TOGGLE_GREEN 'g'
#define CMD_TOGGLE_RED 'r'
#define CMD_BELL 'b'
#define CMD_RFID_ENABLE 'e'
#define CMD_RFID_DISABLE 'd'

/* Set up message strings to be sent back over serial. */
#define MSG_LOCK "DOOR LOCKED"
#define MSG_UNLOCK "DOOR UNLOCKED"
#define MSG_GREEN_OFF "GREEN LED OFF"
#define MSG_GREEN_ON "GREEN LED ON"
#define MSG_RED_OFF "RED LED OFF"
#define MSG_RED_ON "RED LED ON"
#define MSG_BELL "BELL RING"
#define MSG_RFID_ENABLE "RFID READER ENABLED"
#define MSG_RFID_DISABLED "RFID READER DISABLED"


/**** GLOBAL VARIABLES *****/

SoftwareSerial rfidReader(RFID_RX_PIN, RFID_TX_PIN);



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
 *  RFID enable/disable routines.
 **********/
void disableRFID() {
   digitalWrite(RFID_ENABLE_PIN, HIGH);
} /* endfunction */

void enableRFID() {
   digitalWrite(RFID_ENABLE_PIN, LOW);
} /* endfunction */


/**********
 *  Startup routine
 **********/
void setup() {

   /* Initialize communications. */
   Serial.begin(9600);
   rfidReader.begin(2400);

   /* Initialize pins. */
   pinMode(GREEN_LED_PIN, OUTPUT);  
   pinMode(RED_LED_PIN, OUTPUT);  
   pinMode(BELL_PIN, OUTPUT);  
   pinMode(DOOR_LOCK_PIN, OUTPUT);  
   pinMode(RFID_ENABLE_PIN, OUTPUT);  

   /* Start listening for RFID tags, lock the door and turn on 
      the red LED. */
   lockDoor();
   enableRFID();
   digitalWrite(RED_LED_PIN, HIGH);

   Serial.println("/nDoor controller initialized.");
} /* endfunction */



/**********
 *  Main event loop
 **********/
void loop() {

   char cmdChr;
   char rfidChr;
   String rfidCode = "";
   boolean buildCode = false;


   /***** RFID CARD *****/

   if (rfidReader.available()) {

      /* Keep reading till we run out of bytes. */
      while (rfidReader.available()) {
         rfidChr = rfidReader.read();

         /* If we got a start byte, then start storing the code. */
         if (rfidChr == RFID_START_BYTE) {
            buildCode = true;
            rfidCode = "";
         
         /* If we got a stop byte, then make sure we have enough
            characters to build a code.  Otherwise, we have junk. */
         } else if (rfidChr == RFID_STOP_BYTE) {

            if ((buildCode == true) && 
                (rfidCode.length() == RFID_NUM_BYTES)) {
               Serial.print("CARD ");
               Serial.println(rfidCode);
            } /* endif */

            buildCode = false;
            rfidCode = "";

         /* We got a regular character so build the code. */
         } else if (buildCode == true) {

            /* Check to make sure we still have a valid code. */
            if (rfidCode.length() < RFID_NUM_BYTES) {
               rfidCode += rfidChr;

            /* The code is too long, we have garbage somewhere. */
            } else {
               buildCode = false;
               rfidCode = "";
            } /* endif */
         } /* endif */

      } /* endwhile */
            


   /****** SERIAL COMMANDS *****/ 

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
