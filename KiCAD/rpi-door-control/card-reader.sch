EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Carlolib-disc
LIBS:custom-parts
LIBS:raspberrypi-gpio-cache
EELAYER 27 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 2 2
Title "Card Reader"
Date "17 may 2014"
Rev "0.4"
Comp "Shawn Wilson"
Comment1 "RFID card reader for RPi door controller"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RJ45 J2
U 1 1 5321D451
P 8000 3550
F 0 "J2" H 8200 4050 60  0000 C CNN
F 1 "RJ45" H 7850 4050 60  0000 C CNN
F 2 "" H 8000 3550 60  0000 C CNN
F 3 "" H 8000 3550 60  0000 C CNN
	1    8000 3550
	0    1    1    0   
$EndComp
NoConn ~ 8350 4100
$Comp
L R R9
U 1 1 5321D4FE
P 4250 3700
F 0 "R9" V 4330 3700 40  0000 C CNN
F 1 "330" V 4257 3701 40  0000 C CNN
F 2 "~" V 4180 3700 30  0000 C CNN
F 3 "~" H 4250 3700 30  0000 C CNN
	1    4250 3700
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 5321D50D
P 4600 3700
F 0 "R10" V 4680 3700 40  0000 C CNN
F 1 "330" V 4607 3701 40  0000 C CNN
F 2 "~" V 4530 3700 30  0000 C CNN
F 3 "~" H 4600 3700 30  0000 C CNN
	1    4600 3700
	1    0    0    -1  
$EndComp
$Comp
L LED D6
U 1 1 5321D51C
P 4250 4400
F 0 "D6" H 4250 4500 50  0000 C CNN
F 1 "LED" H 4250 4300 50  0000 C CNN
F 2 "~" H 4250 4400 60  0000 C CNN
F 3 "~" H 4250 4400 60  0000 C CNN
	1    4250 4400
	0    1    1    0   
$EndComp
$Comp
L LED D7
U 1 1 5321D52B
P 4600 4400
F 0 "D7" H 4600 4500 50  0000 C CNN
F 1 "LED" H 4600 4300 50  0000 C CNN
F 2 "~" H 4600 4400 60  0000 C CNN
F 3 "~" H 4600 4400 60  0000 C CNN
	1    4600 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 3950 4250 4200
Wire Wire Line
	4600 3950 4600 4200
Wire Wire Line
	3850 5050 6950 5050
Wire Wire Line
	5300 5050 5300 5300
Connection ~ 5300 5050
$Comp
L GND #PWR021
U 1 1 5321D5E0
P 5300 5300
F 0 "#PWR021" H 5300 5300 30  0001 C CNN
F 1 "GND" H 5300 5230 30  0001 C CNN
F 2 "" H 5300 5300 60  0000 C CNN
F 3 "" H 5300 5300 60  0000 C CNN
	1    5300 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4600 4600 5050
Connection ~ 4600 5050
Wire Wire Line
	4250 4600 4250 5050
Connection ~ 4250 5050
$Comp
L CONN_4 P5
U 1 1 5321D611
P 2750 4150
F 0 "P5" V 2700 4150 50  0000 C CNN
F 1 "CONN_4" V 2800 4150 50  0000 C CNN
F 2 "" H 2750 4150 60  0000 C CNN
F 3 "" H 2750 4150 60  0000 C CNN
	1    2750 4150
	-1   0    0    -1  
$EndComp
Text Notes 2550 3700 0    60   ~ 0
RFID Reader
Wire Wire Line
	7550 3200 4250 3200
Wire Wire Line
	4250 3200 4250 3450
Wire Wire Line
	7550 3300 4600 3300
Wire Wire Line
	4600 3300 4600 3450
Wire Wire Line
	3100 4300 3300 4300
Wire Wire Line
	6700 4100 6700 3700
Wire Wire Line
	6700 3700 7550 3700
Wire Wire Line
	3100 4100 6700 4100
NoConn ~ 7550 3400
NoConn ~ 7550 3900
Wire Wire Line
	5950 4200 6800 4200
Wire Wire Line
	6800 4200 6800 3800
Wire Wire Line
	6800 3800 7550 3800
Connection ~ 5950 5050
$Comp
L BUZZER U2
U 1 1 532A1C21
P 6150 4400
F 0 "U2" H 6150 4400 60  0000 C CNN
F 1 "BUZZER" H 6150 4000 60  0000 C CNN
F 2 "" H 6150 4400 60  0000 C CNN
F 3 "" H 6150 4400 60  0000 C CNN
	1    6150 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3500 7300 3500
Wire Wire Line
	7550 3600 7300 3600
Wire Wire Line
	3100 4000 3300 4000
Wire Wire Line
	3300 4000 3300 3750
Wire Wire Line
	3300 4200 3300 4550
Wire Wire Line
	3100 4200 3300 4200
Connection ~ 3300 4300
$Comp
L GND #PWR022
U 1 1 532A21E2
P 3300 4550
F 0 "#PWR022" H 3300 4550 30  0001 C CNN
F 1 "GND" H 3300 4480 30  0001 C CNN
F 2 "" H 3300 4550 60  0000 C CNN
F 3 "" H 3300 4550 60  0000 C CNN
	1    3300 4550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR023
U 1 1 532A21FB
P 3300 3750
F 0 "#PWR023" H 3300 3840 20  0001 C CNN
F 1 "+5V" H 3300 3840 30  0000 C CNN
F 2 "" H 3300 3750 60  0000 C CNN
F 3 "" H 3300 3750 60  0000 C CNN
	1    3300 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 4650 5950 5050
Wire Wire Line
	5950 4200 5950 4500
Text HLabel 7250 3200 0    60   Input ~ 0
RED
Text HLabel 7250 3300 0    60   Input ~ 0
GREEN
Text HLabel 7250 3800 0    60   Input ~ 0
BELL
Text HLabel 7250 3700 0    60   Output ~ 0
RFID TXD
Wire Wire Line
	7300 3500 7300 3000
$Comp
L +5V #PWR024
U 1 1 532A37B1
P 7300 3000
F 0 "#PWR024" H 7300 3090 20  0001 C CNN
F 1 "+5V" H 7300 3090 30  0000 C CNN
F 2 "" H 7300 3000 60  0000 C CNN
F 3 "" H 7300 3000 60  0000 C CNN
	1    7300 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 3600 7300 4150
$Comp
L GND #PWR025
U 1 1 532A37E1
P 7300 4150
F 0 "#PWR025" H 7300 4150 30  0001 C CNN
F 1 "GND" H 7300 4080 30  0001 C CNN
F 2 "" H 7300 4150 60  0000 C CNN
F 3 "" H 7300 4150 60  0000 C CNN
	1    7300 4150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
