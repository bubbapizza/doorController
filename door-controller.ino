/************
 * 
 *  This program is a simple rfid door controller.  It provides a serial 
 *  interface for reading RFID cards and controlling a magnetic door lock.
 *
 *  Pins 2 & 3 read incoming RFID data using the Wiegand protocol.  The
 *  Wiegand protocol is an ancient de-facto standard for door locks, etc.
 *  DOOR_LOCK_PIN controls the 
 * 
 *  Shawn Wilson
 *  Sept 11, 2013
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

   char inChr;

   /* See if we got any info that came in over the Wiegand protocol. 
      i.e.  See if a card was swiped. */
   if (rfidReader.available()) {

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
