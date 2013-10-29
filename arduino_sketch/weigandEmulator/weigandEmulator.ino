/*****************************
 *  This program emulates a Wiegand RFID device.  This code is
 *  modified from an HID ProxPoint Skimmer written by Brad Antoniewicz.
 *  I just pulled out the code that taked data received from the serial
 *  interface on the Arduino (in binary) and sends the data out using
 *  the Wiegand protocol.
 *
 * Arduino Pinouts:
 *        8 - Wiegand output Data 0 (Green)
 *        9 - Wiegand output Data 1 (White)
 *
 * 26-Bit Wiegant Format: 
 * Bit 1 = Even Parity over Bits 2 - 13
 * Bits 2 - 9 = Facility Code (0 to 255) Bit 2 is MSB
 * Bits 10 - 25 = ID Number (0 to 65,535) Bit 10 is MSB
 * Bits 26 Odd parity over bits 14 to 25
 *
 *  Shawn Wilson
 *  Sept. 11, 2013
 *****************************/

/* CONSTANTS */
#define CARD_LEN 26
#define LED 13   // output LED
#define WIEGAND_D0 8  // output DATA0 (Green) to Controller
#define WIEGAND_D1 9  // output DATA1 (White) to Controller
#define DELAY_BIT_SIGNAL 1000  //signal delay in microseconds
#define DELAY_BIT_SPACING 10000  //signal delay in microseconds

/* VARIABLES */ 
unsigned long cardValue = 0;
int incomingByte = 0; 
int sInputCount = 0;


/******
 * Reset serial port to ready state.
 ******/
void resetState() {
   Serial.println("[+] Reseting State...");
   delay(10);
   Serial.flush();
   sInputCount=0;
} /* endfunction */


/******
 * Write a card value using Wiegand protocol.
 ******/
void writeCard(volatile unsigned long sendValue) {

    short x;

    Serial.println("[-] Sending Data:");
    Serial.print("\t");

    /*
     *  Loop through each bit of the send value and send bits 
     *  one at a time. 
     */
    for (x = CARD_LEN; x >= 0; x--) {

      /** 1 **/
      if (bitRead(sendValue, x) == 1) {
        Serial.print("1"); 
        digitalWrite(WIEGAND_D1, LOW);
        delayMicroseconds(DELAY_BIT_SIGNAL);
        digitalWrite(WIEGAND_D1, HIGH);

      /** 0 **/
      } else if (bitRead(sendValue, x) == 0) {
        Serial.print("0");
        digitalWrite(WIEGAND_D0, LOW);
        delayMicroseconds(DELAY_BIT_SIGNAL);
        digitalWrite(WIEGAND_D0, HIGH);
      } /* endif */

      delayMicroseconds(DELAY_BIT_SPACING);
    } /* endfor */

    Serial.println();
} /* endfunction */



/******
 *  Build the card value one from '0' and '1' characters.
 ******/
void processInput(int byte) {
   if (byte == 49) { // DECIMAL 1 
      sInputCount++; 
      bitSet(cardValue, CARD_LEN - sInputCount);

   } else if (byte == 48) { // DECIMAL 0
      sInputCount++; 
      bitClear(cardValue, CARD_LEN - sInputCount);

   } else {
       Serial.print("[!] Recieved invalid Value:");
       Serial.println(byte);
       resetState();
   } /* endif */
} /* endfunction */


/******
 *  Decode a card value and print the details of it.
 ******/
void printCardData(unsigned long data) {
   int serialNumber = (data >> 1) & 0x3fff;
   int siteCode = (data >> 17) & 0x3ff;

   Serial.print("\tHEX: ");
   Serial.print(data,HEX);
   Serial.print(" SITE: ");
   Serial.print(siteCode);
   Serial.print(" CODE: ");
   Serial.println(serialNumber);
   Serial.print("\tBINARY: ");
   Serial.println(data, BIN);
} /* endfunction */


/********
 *  INITIAL STARTUP
 ********/
void setup() {

  /* Initialize the protocol pins. */
  pinMode(WIEGAND_D0, OUTPUT);
  pinMode(WIEGAND_D1, OUTPUT);

  /* When both pins are high, it means no data. */
  digitalWrite(WIEGAND_D0, HIGH);
  digitalWrite(WIEGAND_D1, HIGH);
  
  sInputCount = 0; 
  Serial.begin(9600);
  Serial.println("Please provide a tag value");
  Serial.println("For Binary input, it must be 26 bits long");
  Serial.println("No parity needs, just add two 0's to the beginning");
  Serial.println("e.g. 00001001100011111110010101");
}


/******
 *  MAIN LOOP
 ******/
void loop() {
  
   /* 
    *  Accept input via the serial interface. 
    */
   if (Serial.available() > 0 ) {
     
      /* Read in one byte and print a dot if a character is received. */
      incomingByte = Serial.read();
      Serial.print(".");
      delay(10);
  
      processInput(incomingByte);
      if ((sInputCount > 0) && (sInputCount != CARD_LEN) && 
          (Serial.peek() == -1)) {
 
         Serial.println("\n[!] Invalid Input Length!");
         resetState();
      } /* endif */
   } /* endif */


   /* If we got the right number of card digits, send the value. */
   if (sInputCount == CARD_LEN) {
      Serial.println("");
      Serial.println("[-] Sending current Serial Buffer");
      writeCard(cardValue); 
      printCardData(cardValue);
      resetState();


   } else if (sInputCount > CARD_LEN) {
      Serial.println("[!] Sorry, looks like your input was too long.. ");
      resetState();
   } /* endif */
          
} /* endfunction */

