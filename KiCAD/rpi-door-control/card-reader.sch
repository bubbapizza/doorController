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
LIBS:raspberrypi-gpio-cache
EELAYER 27 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "Card Reader"
Date "13 mar 2014"
Rev "0.1"
Comp "Shawn Wilson"
Comment1 "RFID card reader for RPi door controller"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RJ45 J?
U 1 1 5321D451
P 8000 3550
F 0 "J?" H 8200 4050 60  0000 C CNN
F 1 "RJ45" H 7850 4050 60  0000 C CNN
F 2 "" H 8000 3550 60  0000 C CNN
F 3 "" H 8000 3550 60  0000 C CNN
	1    8000 3550
	0    1    1    0   
$EndComp
NoConn ~ 8350 4100
Wire Wire Line
	3850 3050 6850 3050
$Comp
L +5V #PWR?
U 1 1 5321D46C
P 5300 2850
F 0 "#PWR?" H 5300 2940 20  0001 C CNN
F 1 "+5V" H 5300 2940 30  0000 C CNN
F 2 "" H 5300 2850 60  0000 C CNN
F 3 "" H 5300 2850 60  0000 C CNN
	1    5300 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2850 5300 3050
Connection ~ 5300 3050
$Comp
L PWR_FLAG #FLG?
U 1 1 5321D47F
P 5300 2900
F 0 "#FLG?" H 5300 2995 30  0001 C CNN
F 1 "PWR_FLAG" H 5300 3080 30  0000 C CNN
F 2 "" H 5300 2900 60  0000 C CNN
F 3 "" H 5300 2900 60  0000 C CNN
	1    5300 2900
	0    1    1    0   
$EndComp
Connection ~ 5300 2900
Text Label 6650 3050 0    60   ~ 0
+5V
Wire Wire Line
	7100 3600 7550 3600
Wire Wire Line
	7550 3500 7100 3500
Text Label 7100 3600 0    60   ~ 0
+5V
Text Label 7100 3500 0    60   ~ 0
GND
$Comp
L R R?
U 1 1 5321D4FE
P 4250 3700
F 0 "R?" V 4330 3700 40  0000 C CNN
F 1 "330" V 4257 3701 40  0000 C CNN
F 2 "~" V 4180 3700 30  0000 C CNN
F 3 "~" H 4250 3700 30  0000 C CNN
	1    4250 3700
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5321D50D
P 4600 3700
F 0 "R?" V 4680 3700 40  0000 C CNN
F 1 "330" V 4607 3701 40  0000 C CNN
F 2 "~" V 4530 3700 30  0000 C CNN
F 3 "~" H 4600 3700 30  0000 C CNN
	1    4600 3700
	1    0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5321D51C
P 4250 4400
F 0 "D?" H 4250 4500 50  0000 C CNN
F 1 "LED" H 4250 4300 50  0000 C CNN
F 2 "~" H 4250 4400 60  0000 C CNN
F 3 "~" H 4250 4400 60  0000 C CNN
	1    4250 4400
	0    1    1    0   
$EndComp
$Comp
L LED D?
U 1 1 5321D52B
P 4600 4400
F 0 "D?" H 4600 4500 50  0000 C CNN
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
Text Label 6700 5050 0    60   ~ 0
GND
Wire Wire Line
	5300 5050 5300 5300
Connection ~ 5300 5050
$Comp
L GND #PWR?
U 1 1 5321D5E0
P 5300 5300
F 0 "#PWR?" H 5300 5300 30  0001 C CNN
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
L CONN_4 P?
U 1 1 5321D611
P 2750 4050
F 0 "P?" V 2700 4050 50  0000 C CNN
F 1 "CONN_4" V 2800 4050 50  0000 C CNN
F 2 "" H 2750 4050 60  0000 C CNN
F 3 "" H 2750 4050 60  0000 C CNN
	1    2750 4050
	-1   0    0    1   
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
	3100 3900 3650 3900
Text Label 3650 3900 2    60   ~ 0
GND
Wire Wire Line
	3100 4200 3650 4200
Text Label 3650 4200 2    60   ~ 0
+5V
Wire Wire Line
	3100 4000 3300 4000
Wire Wire Line
	3300 4000 3300 3900
Connection ~ 3300 3900
Wire Wire Line
	6700 4100 6700 3700
Wire Wire Line
	6700 3700 7550 3700
Wire Wire Line
	3100 4100 6700 4100
Text Label 3650 4100 2    60   ~ 0
RFID TXD
NoConn ~ 7550 3400
NoConn ~ 7550 3900
$Comp
L CRYSTAL X?
U 1 1 5321D8C3
P 5950 4500
F 0 "X?" H 5950 4650 60  0000 C CNN
F 1 "CRYSTAL" H 5950 4350 60  0000 C CNN
F 2 "~" H 5950 4500 60  0000 C CNN
F 3 "~" H 5950 4500 60  0000 C CNN
	1    5950 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 4200 6800 4200
Wire Wire Line
	6800 4200 6800 3800
Wire Wire Line
	6800 3800 7550 3800
Wire Wire Line
	5950 4800 5950 5050
Connection ~ 5950 5050
Text Notes 6400 4550 2    60   ~ 0
BELL
Text Notes 5050 4450 2    60   ~ 0
GREEN
Text Notes 4050 4450 2    60   ~ 0
RED
$EndSCHEMATC
