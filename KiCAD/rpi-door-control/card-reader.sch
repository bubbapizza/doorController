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
Date "13 dec 2014"
Rev "0.5"
Comp "Shawn Wilson"
Comment1 "RFID card reader for RPi door controller"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R9
U 1 1 5321D4FE
P 4250 4400
F 0 "R9" V 4330 4400 40  0000 C CNN
F 1 "330" V 4257 4401 40  0000 C CNN
F 2 "~" V 4180 4400 30  0000 C CNN
F 3 "~" H 4250 4400 30  0000 C CNN
	1    4250 4400
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 5321D50D
P 4600 4400
F 0 "R10" V 4680 4400 40  0000 C CNN
F 1 "330" V 4607 4401 40  0000 C CNN
F 2 "~" V 4530 4400 30  0000 C CNN
F 3 "~" H 4600 4400 30  0000 C CNN
	1    4600 4400
	1    0    0    -1  
$EndComp
$Comp
L LED D6
U 1 1 5321D51C
P 4250 4850
F 0 "D6" H 4250 4950 50  0000 C CNN
F 1 "LED" H 4250 4750 50  0000 C CNN
F 2 "~" H 4250 4850 60  0000 C CNN
F 3 "~" H 4250 4850 60  0000 C CNN
	1    4250 4850
	0    1    1    0   
$EndComp
$Comp
L LED D7
U 1 1 5321D52B
P 4600 4850
F 0 "D7" H 4600 4950 50  0000 C CNN
F 1 "LED" H 4600 4750 50  0000 C CNN
F 2 "~" H 4600 4850 60  0000 C CNN
F 3 "~" H 4600 4850 60  0000 C CNN
	1    4600 4850
	0    1    1    0   
$EndComp
$Comp
L GND #PWR021
U 1 1 5321D5E0
P 5300 5400
F 0 "#PWR021" H 5300 5400 30  0001 C CNN
F 1 "GND" H 5300 5330 30  0001 C CNN
F 2 "" H 5300 5400 60  0000 C CNN
F 3 "" H 5300 5400 60  0000 C CNN
	1    5300 5400
	1    0    0    -1  
$EndComp
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
Text HLabel 7250 4000 0    60   Input ~ 0
GREEN
Text HLabel 7250 4200 0    60   Input ~ 0
BELL
Text HLabel 7250 4100 0    60   Output ~ 0
RFID TXD
$Comp
L +5V #PWR024
U 1 1 532A37B1
P 7350 3600
F 0 "#PWR024" H 7350 3690 20  0001 C CNN
F 1 "+5V" H 7350 3690 30  0000 C CNN
F 2 "" H 7350 3600 60  0000 C CNN
F 3 "" H 7350 3600 60  0000 C CNN
	1    7350 3600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR025
U 1 1 532A37E1
P 7350 4600
F 0 "#PWR025" H 7350 4600 30  0001 C CNN
F 1 "GND" H 7350 4530 30  0001 C CNN
F 2 "" H 7350 4600 60  0000 C CNN
F 3 "" H 7350 4600 60  0000 C CNN
	1    7350 4600
	1    0    0    -1  
$EndComp
$Comp
L CONN_6 P7
U 1 1 548C566E
P 7900 4050
F 0 "P7" V 7850 4050 60  0000 C CNN
F 1 "CONN_6" V 7950 4050 60  0000 C CNN
F 2 "" H 7900 4050 60  0000 C CNN
F 3 "" H 7900 4050 60  0000 C CNN
	1    7900 4050
	1    0    0    -1  
$EndComp
$Comp
L RJ45 J2
U 1 1 548C595F
P 7600 2000
F 0 "J2" H 7800 2500 60  0000 C CNN
F 1 "RJ45" H 7450 2500 60  0000 C CNN
F 2 "" H 7600 2000 60  0000 C CNN
F 3 "" H 7600 2000 60  0000 C CNN
	1    7600 2000
	0    1    -1   0   
$EndComp
$Comp
L CONN_6 P6
U 1 1 548C596E
P 3650 1900
F 0 "P6" V 3600 1900 60  0000 C CNN
F 1 "CONN_6" V 3700 1900 60  0000 C CNN
F 2 "" H 3650 1900 60  0000 C CNN
F 3 "" H 3650 1900 60  0000 C CNN
	1    3650 1900
	-1   0    0    -1  
$EndComp
NoConn ~ 7950 1450
NoConn ~ 7150 1950
NoConn ~ 7150 2150
Text HLabel 7250 3900 0    60   Input ~ 0
RED
$Comp
L +5V #PWR026
U 1 1 548C6052
P 5700 1450
F 0 "#PWR026" H 5700 1540 20  0001 C CNN
F 1 "+5V" H 5700 1540 30  0000 C CNN
F 2 "" H 5700 1450 60  0000 C CNN
F 3 "" H 5700 1450 60  0000 C CNN
	1    5700 1450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR027
U 1 1 548C6061
P 5700 2550
F 0 "#PWR027" H 5700 2550 30  0001 C CNN
F 1 "GND" H 5700 2480 30  0001 C CNN
F 2 "" H 5700 2550 60  0000 C CNN
F 3 "" H 5700 2550 60  0000 C CNN
	1    5700 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 5150 6950 5150
Wire Wire Line
	5300 5150 5300 5400
Connection ~ 5300 5150
Connection ~ 4600 5150
Connection ~ 4250 5150
Wire Wire Line
	7550 3900 4250 3900
Wire Wire Line
	7550 4000 4600 4000
Wire Wire Line
	3100 4300 3300 4300
Wire Wire Line
	3100 4100 7550 4100
Wire Wire Line
	5950 4200 7550 4200
Connection ~ 5950 5150
Wire Wire Line
	3100 4000 3300 4000
Wire Wire Line
	3300 4000 3300 3750
Wire Wire Line
	3300 4200 3300 4550
Wire Wire Line
	3100 4200 3300 4200
Connection ~ 3300 4300
Wire Wire Line
	5950 4200 5950 4500
Wire Wire Line
	4250 3900 4250 4150
Wire Wire Line
	7550 3800 7350 3800
Wire Wire Line
	7350 3800 7350 3600
Wire Wire Line
	7550 4300 7350 4300
Wire Wire Line
	7350 4300 7350 4600
Wire Wire Line
	4250 5050 4250 5150
Wire Wire Line
	5950 5150 5950 4650
Wire Wire Line
	7150 1650 4000 1650
Wire Wire Line
	7150 1750 5500 1750
Wire Wire Line
	5500 1750 5500 2050
Wire Wire Line
	4000 1950 6400 1950
Wire Wire Line
	4000 2150 6400 2150
Wire Wire Line
	4700 2250 7150 2250
Wire Wire Line
	4800 2350 7150 2350
Wire Wire Line
	6400 2150 6400 2050
Wire Wire Line
	6400 2050 7150 2050
Wire Wire Line
	6400 1950 6400 1850
Wire Wire Line
	6400 1850 7150 1850
Wire Wire Line
	5500 2050 4000 2050
Wire Wire Line
	4700 2250 4700 1850
Wire Wire Line
	4700 1850 4000 1850
Wire Wire Line
	4800 2350 4800 1750
Wire Wire Line
	4800 1750 4000 1750
Wire Wire Line
	5700 1450 5700 1650
Connection ~ 5700 1650
Wire Wire Line
	5700 2550 5700 2150
Connection ~ 5700 2150
Text HLabel 7050 1750 0    60   Input ~ 0
BELL
Text HLabel 7050 1850 0    60   Output ~ 0
RFID TXD
Text HLabel 7050 2250 0    60   Input ~ 0
GREEN
Text HLabel 7050 2350 0    60   Input ~ 0
RED
Wire Wire Line
	4600 5050 4600 5150
Wire Wire Line
	4600 4000 4600 4150
$EndSCHEMATC
