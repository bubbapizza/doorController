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

/* Set serial communications rates. */
#define BITRATE_SERIAL_COMMANDS 9600
#define BITRATE_RFID_READER 2400

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

/* Set the piezo buzzer frequency and duration. */
#define BELL_FREQUENCY 261  // middle C
#define BELL_DURATION 500  // milliseconds

/* Set up commands triggered by incoming characters over serial. */
#define CMD_DOOR_UNLOCK 'd'
#define CMD_DOOR_LOCK 'D'
#define CMD_GREEN_OFF 'g'
#define CMD_GREEN_ON 'G'
#define CMD_RED_OFF 'r'
#define CMD_RED_ON 'R'
#define CMD_BELL 'b'
#define CMD_RFID_DISABLE 'f'
#define CMD_RFID_ENABLE 'F'
#define CMD_STATUS 's'

/* Set up message strings to be sent back over serial. */
#define MSG_LOCK "DOOR LOCKED"
#define MSG_UNLOCK "DOOR UNLOCKED"
#define MSG_GREEN_OFF "GREEN LED OFF"
#define MSG_GREEN_ON "GREEN LED ON"
#define MSG_RED_OFF "RED LED OFF"
#define MSG_RED_ON "RED LED ON"
#define MSG_BELL "BELL RING"
#define MSG_RFID_ENABLED "RFID READER ENABLED"
#define MSG_RFID_DISABLED "RFID READER DISABLED"
#define MSG_STATUS_HEADER "===== Door Controller Status ======"
#define MSG_STATUS_FOOTER "==================================="


/**** GLOBAL VARIABLES *****/

SoftwareSerial rfidReader(RFID_RX_PIN, RFID_TX_PIN);
char cmdChr;
char rfidChr;
String rfidCode = "";
boolean buildCode = false;



/**********
 *  Set up function for printing door lock status.
 **********/
void printStatus() {
   Serial.println(MSG_STATUS_HEADER);
   Serial.print("VERSION ");
   Serial.println(VERSION);

   /* Get RFID reader status. */
   if (!digitalRead(RFID_ENABLE_PIN)) {
      Serial.println(MSG_RFID_ENABLED);
   } else {
      Serial.println(MSG_RFID_DISABLED);
   } /* endif */

   /* Get door status. */
   if (digitalRead(DOOR_LOCK_PIN)) {
      Serial.println(MSG_LOCK);
   } else {
      Serial.println(MSG_UNLOCK);
   } /* endif */

   /* Get green LED status. */
   if (digitalRead(GREEN_LED_PIN)) {
      Serial.println(MSG_GREEN_ON);
   } else {
      Serial.println(MSG_GREEN_OFF);
   } /* endif */

   /* Get red LED status. */
   if (digitalRead(RED_LED_PIN)) {
      Serial.println(MSG_RED_ON);
   } else {
      Serial.println(MSG_RED_OFF);
   } /* endif */

   Serial.println(MSG_STATUS_FOOTER);
} /* endfunction */


/**********
 *  Set up door lock/unlock functions.
 **********/
void lockDoor() {
   digitalWrite(DOOR_LOCK_PIN, HIGH);
} /* endfunction */

void unlockDoor() {
   digitalWrite(DOOR_LOCK_PIN, LOW);
} /* endfunction */


/**********
 *  Set up RFID enable/disable functions.
 **********/
void disableRFID() {
   digitalWrite(RFID_ENABLE_PIN, HIGH);
} /* endfunction */

void enableRFID() {
   digitalWrite(RFID_ENABLE_PIN, LOW);
} /* endfunction */


/**********
 *  INIT ROUTINE
 **********/
void setup() {

   /* Initialize communications. */
   Serial.begin(BITRATE_SERIAL_COMMANDS);
   rfidReader.begin(BITRATE_RFID_READER);

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

   Serial.print("\nDoor controller ver. ");
   Serial.print(VERSION);
   Serial.println(" initialized.");
} /* endfunction */



/**********
 *  EVENT LOOP
 **********/
void loop() {

   /***** READ RFID CARD *****/

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
   } /* endif */
            


   /****** READ SERIAL COMMANDS *****/ 

   if (Serial.available() > 0) {
         
         cmdChr = Serial.read();

         /* 
          *  Execute any one-character commands that came in on the
          *  serial port.
          */

         /*** Unlock door. ***/
         if (cmdChr == CMD_DOOR_UNLOCK) {
            unlockDoor();
            Serial.println(MSG_UNLOCK);

         /*** Lock door. ***/
         } else if (cmdChr == CMD_DOOR_LOCK) {
            lockDoor();
            Serial.println(MSG_LOCK);

         /*** Turn on green LED. ***/
         } else if (cmdChr == CMD_GREEN_ON) {
            digitalWrite(GREEN_LED_PIN, HIGH);
            Serial.println(MSG_GREEN_ON);

         /*** Turn off green LED. ***/
         } else if (cmdChr == CMD_GREEN_OFF) {
            digitalWrite(GREEN_LED_PIN, LOW);
            Serial.println(MSG_GREEN_OFF);

         /*** Turn on red LED. ***/
         } else if (cmdChr == CMD_RED_ON) {
            digitalWrite(RED_LED_PIN, HIGH);
            Serial.println(MSG_RED_ON);

         /*** Turn off red LED. ***/
         } else if (cmdChr == CMD_RED_OFF) {
            digitalWrite(RED_LED_PIN, LOW);
            Serial.println(MSG_RED_OFF);

         /*** Enable RFID reader. ***/
         } else if (cmdChr == CMD_RFID_ENABLE) {
            enableRFID();
            Serial.println(MSG_RFID_ENABLED);

         /*** Disable RFID reader. ***/
         } else if (cmdChr == CMD_RFID_DISABLE) {
            disableRFID();
            Serial.println(MSG_RFID_DISABLED);

         /*** Ring bell. ***/
         } else if (cmdChr == CMD_BELL) {
            tone(BELL_PIN, BELL_FREQUENCY, BELL_DURATION);
            Serial.println(MSG_BELL);

         /*** Ring bell. ***/
         } else if (cmdChr == CMD_STATUS) {
            printStatus();

         } /* endif */
   } /* endif */

} /* endfunction */
