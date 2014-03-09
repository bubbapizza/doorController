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
$Descr User 17000 11000
encoding utf-8
Sheet 1 1
Title "Door Controller"
Date "9 mar 2014"
Rev "0.2"
Comp "Shawn Wilson"
Comment1 "Raspberry Pi Door Controller"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L LED D?
U 1 1 531924B3
P 9700 5400
F 0 "D?" H 9700 5500 50  0000 C CNN
F 1 "LED" H 9700 5300 50  0000 C CNN
F 2 "" H 9700 5400 60  0001 C CNN
F 3 "" H 9700 5400 60  0001 C CNN
	1    9700 5400
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 5319244B
P 10150 5400
F 0 "R?" V 10230 5400 50  0000 C CNN
F 1 "2K" V 10150 5400 50  0000 C CNN
F 2 "" H 10150 5400 60  0001 C CNN
F 3 "" H 10150 5400 60  0001 C CNN
	1    10150 5400
	0    -1   -1   0   
$EndComp
$Comp
L 1N4004 D?
U 1 1 53192395
P 10000 4900
F 0 "D?" H 9925 4975 40  0000 L BNN
F 1 "1N4007" H 9850 4800 40  0000 L CNN
F 2 "DO7" H 10000 5050 30  0001 C CNN
F 3 "" H 10000 4900 60  0001 C CNN
	1    10000 4900
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53191D01
P 8350 4850
F 0 "R?" V 8430 4850 50  0000 C CNN
F 1 "1K" V 8350 4850 50  0000 C CNN
F 2 "" H 8350 4850 60  0001 C CNN
F 3 "" H 8350 4850 60  0001 C CNN
	1    8350 4850
	0    -1   -1   0   
$EndComp
$Comp
L CONN_13X2 P1
U 1 1 50A55ABA
P 5800 4450
F 0 "P1" H 5800 5150 60  0000 C CNN
F 1 "CONN_13X2" V 5800 4450 50  0000 C CNN
F 2 "" H 5800 4450 60  0001 C CNN
F 3 "" H 5800 4450 60  0001 C CNN
	1    5800 4450
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR01
U 1 1 50A55B18
P 5300 3700
F 0 "#PWR01" H 5300 3660 30  0001 C CNN
F 1 "+3.3V" H 5300 3810 30  0000 C CNN
F 2 "" H 5300 3700 60  0001 C CNN
F 3 "" H 5300 3700 60  0001 C CNN
	1    5300 3700
	1    0    0    -1  
$EndComp
NoConn ~ 6200 3950
Text Label 4650 3950 0    60   ~ 0
GPIO0(SDA)
Text Label 4650 4050 0    60   ~ 0
GPIO1(SCL)
Text Label 4650 4150 0    60   ~ 0
GPIO4
NoConn ~ 5400 4250
Text Label 4650 4350 0    60   ~ 0
GPIO17
Text Label 4650 4550 0    60   ~ 0
GPIO22
NoConn ~ 5400 4650
Text Label 4650 4750 0    60   ~ 0
GPIO10(MOSI)
Text Label 4650 4850 0    60   ~ 0
GPIO9(MISO)
Text Label 4650 4950 0    60   ~ 0
GPIO11(SCLK)
NoConn ~ 5400 5050
Text Label 6900 4150 2    60   ~ 0
TXD
Text Label 6900 4250 2    60   ~ 0
RXD
Text Label 6900 4350 2    60   ~ 0
GPIO18
NoConn ~ 6200 4450
Text Label 6900 4550 2    60   ~ 0
GPIO23
Text Label 6900 4650 2    60   ~ 0
GPIO24
NoConn ~ 6200 4750
Text Label 6900 4850 2    60   ~ 0
GPIO25
Text Label 6900 4950 2    60   ~ 0
GPIO8(CE0)
Text Label 6900 5050 2    60   ~ 0
GPIO7(CE1)
$Comp
L +12V #PWR?
U 1 1 530E9536
P 12150 4350
F 0 "#PWR?" H 12150 4300 20  0001 C CNN
F 1 "+12V" H 12150 4450 30  0000 C CNN
F 2 "" H 12150 4350 60  0001 C CNN
F 3 "" H 12150 4350 60  0001 C CNN
	1    12150 4350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 530E955A
P 12150 5800
F 0 "#PWR?" H 12150 5800 30  0001 C CNN
F 1 "GND" H 12150 5730 30  0001 C CNN
F 2 "" H 12150 5800 60  0001 C CNN
F 3 "" H 12150 5800 60  0001 C CNN
	1    12150 5800
	1    0    0    -1  
$EndComp
$Comp
L NPN Q?
U 1 1 531A5608
P 8950 4850
F 0 "Q?" H 8950 4700 50  0000 R CNN
F 1 "N3904" H 8950 5000 50  0000 R CNN
F 2 "~" H 8950 4850 60  0000 C CNN
F 3 "~" H 8950 4850 60  0000 C CNN
	1    8950 4850
	1    0    0    -1  
$EndComp
$Comp
L CONN_2X2 P?
U 1 1 531A6436
P 11550 4800
F 0 "P?" H 11550 4950 50  0000 C CNN
F 1 "CONN_2X2" H 11560 4670 40  0000 C CNN
F 2 "" H 11550 4800 60  0000 C CNN
F 3 "" H 11550 4800 60  0000 C CNN
	1    11550 4800
	1    0    0    -1  
$EndComp
$Comp
L RELAY U?
U 1 1 531A655B
P 10150 4100
F 0 "U?" H 10100 3500 60  0000 C CNN
F 1 "RELAY" H 10100 4400 60  0000 C CNN
F 2 "" H 10100 4100 60  0000 C CNN
F 3 "" H 10100 4100 60  0000 C CNN
	1    10150 4100
	1    0    0    -1  
$EndComp
NoConn ~ 9700 3950
Text Notes 11200 4550 0    60   ~ 0
12V Power Supply
$Comp
L CONN_2X2 P?
U 1 1 531A6A64
P 11550 3400
F 0 "P?" H 11550 3550 50  0000 C CNN
F 1 "CONN_2X2" H 11560 3270 40  0000 C CNN
F 2 "" H 11550 3400 60  0000 C CNN
F 3 "" H 11550 3400 60  0000 C CNN
	1    11550 3400
	-1   0    0    1   
$EndComp
Text Notes 11400 3150 0    60   ~ 0
Maglock
Text Notes 11950 3350 0    60   ~ 0
+
Text Notes 11950 3550 0    60   ~ 0
-
Text Notes 9550 5150 0    60   ~ 0
Maglock\nPower
$Comp
L R R?
U 1 1 531C80F2
P 7900 4300
F 0 "R?" V 7980 4300 40  0000 C CNN
F 1 "330" V 7907 4301 40  0000 C CNN
F 2 "~" V 7830 4300 30  0000 C CNN
F 3 "~" H 7900 4300 30  0000 C CNN
	1    7900 4300
	1    0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 531C8101
P 7900 3850
F 0 "D?" H 7900 3950 50  0000 C CNN
F 1 "LED" H 7900 3750 50  0000 C CNN
F 2 "~" H 7900 3850 60  0000 C CNN
F 3 "~" H 7900 3850 60  0000 C CNN
	1    7900 3850
	0    -1   -1   0   
$EndComp
Text Notes 7800 3650 0    60   ~ 0
DOOR
$Comp
L LED D?
U 1 1 531C8331
P 7600 3850
F 0 "D?" H 7600 3950 50  0000 C CNN
F 1 "LED" H 7600 3750 50  0000 C CNN
F 2 "~" H 7600 3850 60  0000 C CNN
F 3 "~" H 7600 3850 60  0000 C CNN
	1    7600 3850
	0    -1   -1   0   
$EndComp
$Comp
L LED D?
U 1 1 531C8340
P 7300 3850
F 0 "D?" H 7300 3950 50  0000 C CNN
F 1 "LED" H 7300 3750 50  0000 C CNN
F 2 "~" H 7300 3850 60  0000 C CNN
F 3 "~" H 7300 3850 60  0000 C CNN
	1    7300 3850
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 531C834F
P 7300 4300
F 0 "R?" V 7380 4300 40  0000 C CNN
F 1 "330" V 7307 4301 40  0000 C CNN
F 2 "~" V 7230 4300 30  0000 C CNN
F 3 "~" H 7300 4300 30  0000 C CNN
	1    7300 4300
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 531C835E
P 7600 4300
F 0 "R?" V 7680 4300 40  0000 C CNN
F 1 "330" V 7607 4301 40  0000 C CNN
F 2 "~" V 7530 4300 30  0000 C CNN
F 3 "~" H 7600 4300 30  0000 C CNN
	1    7600 4300
	1    0    0    -1  
$EndComp
Text Notes 7500 3650 0    60   ~ 0
RED
Text Notes 7150 3650 0    60   ~ 0
GREEN
Text Label 6900 4050 2    60   ~ 0
GND
$Comp
L +5V #PWR?
U 1 1 531C8826
P 6300 3700
F 0 "#PWR?" H 6300 3790 20  0001 C CNN
F 1 "+5V" H 6300 3790 30  0000 C CNN
F 2 "" H 6300 3700 60  0000 C CNN
F 3 "" H 6300 3700 60  0000 C CNN
	1    6300 3700
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW?
U 1 1 531C8935
P 4050 3450
F 0 "SW?" H 4200 3560 50  0000 C CNN
F 1 "SW_PUSH" H 4050 3370 50  0000 C CNN
F 2 "~" H 4050 3450 60  0000 C CNN
F 3 "~" H 4050 3450 60  0000 C CNN
	1    4050 3450
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 531C8A1E
P 4050 3850
F 0 "R?" V 4130 3850 40  0000 C CNN
F 1 "10K" V 4057 3851 40  0000 C CNN
F 2 "~" V 3980 3850 30  0000 C CNN
F 3 "~" H 4050 3850 30  0000 C CNN
	1    4050 3850
	0    -1   -1   0   
$EndComp
Text Notes 3900 3250 0    60   ~ 0
BUTTON
$Comp
L CONN_6X2 P?
U 1 1 531C8FB0
P 11550 6750
F 0 "P?" H 11550 7100 60  0000 C CNN
F 1 "CONN_6X2" V 11550 6750 60  0000 C CNN
F 2 "" H 11550 6750 60  0000 C CNN
F 3 "" H 11550 6750 60  0000 C CNN
	1    11550 6750
	1    0    0    -1  
$EndComp
Text Notes 11200 6250 0    60   ~ 0
Card Reader Unit\n
Text Label 12400 6500 2    39   ~ 0
RED
Text Label 12400 6600 2    39   ~ 0
GREEN
Text Label 12400 6700 2    39   ~ 0
GND
Text Label 12400 6800 2    39   ~ 0
RFID DATA
Text Label 12400 6900 2    39   ~ 0
+5V
Text Label 12400 7000 2    39   ~ 0
BELL
Text Label 4650 4450 0    60   ~ 0
GPIO21
$Comp
L R R?
U 1 1 531C991C
P 6950 6200
F 0 "R?" V 7030 6200 40  0000 C CNN
F 1 "1.8K" V 6957 6201 40  0000 C CNN
F 2 "~" V 6880 6200 30  0000 C CNN
F 3 "~" H 6950 6200 30  0000 C CNN
	1    6950 6200
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 531C9D88
P 7050 5700
F 0 "R?" V 7130 5700 40  0000 C CNN
F 1 "3.3K" V 7057 5701 40  0000 C CNN
F 2 "~" V 6980 5700 30  0000 C CNN
F 3 "~" H 7050 5700 30  0000 C CNN
	1    7050 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	12150 4350 12150 4750
Wire Wire Line
	6200 5050 6900 5050
Wire Wire Line
	6200 4950 6900 4950
Wire Wire Line
	6200 4650 7600 4650
Wire Wire Line
	6200 4550 7300 4550
Wire Wire Line
	6200 4350 6900 4350
Wire Wire Line
	5400 4950 4650 4950
Wire Wire Line
	5400 4850 4650 4850
Wire Wire Line
	5400 4750 4650 4750
Wire Wire Line
	5400 4550 4650 4550
Wire Wire Line
	3600 4350 5400 4350
Wire Wire Line
	5400 4150 4650 4150
Wire Wire Line
	5400 4050 4650 4050
Wire Wire Line
	5400 3950 4650 3950
Wire Wire Line
	4300 3850 5400 3850
Wire Wire Line
	5300 3850 5300 3700
Wire Wire Line
	8600 4850 8750 4850
Wire Wire Line
	12150 4750 11950 4750
Wire Wire Line
	11950 4850 12150 4850
Wire Wire Line
	12150 4850 12150 5800
Wire Wire Line
	9050 4500 9700 4500
Wire Wire Line
	9050 4500 9050 4650
Wire Wire Line
	11150 4850 11000 4850
Wire Wire Line
	11000 3450 11000 5900
Wire Wire Line
	9500 5400 9500 5750
Wire Wire Line
	9500 5750 11000 5750
Wire Wire Line
	9050 5050 9050 5900
Wire Wire Line
	9050 5900 11000 5900
Connection ~ 11000 5750
Wire Wire Line
	9450 4500 9450 4900
Wire Wire Line
	9450 4900 9850 4900
Connection ~ 9450 4500
Wire Wire Line
	10700 4100 10700 5400
Wire Wire Line
	10700 5400 10400 5400
Wire Wire Line
	10700 4100 10500 4100
Wire Wire Line
	10700 4300 10500 4300
Connection ~ 10700 4300
Wire Wire Line
	11150 4750 10700 4750
Connection ~ 10700 4750
Wire Wire Line
	10150 4900 10700 4900
Connection ~ 10700 4900
Wire Wire Line
	9700 4250 9450 4250
Wire Wire Line
	9450 4250 9450 3350
Wire Wire Line
	9450 3350 11150 3350
Wire Wire Line
	11150 3450 11000 3450
Connection ~ 11000 4850
Wire Wire Line
	6200 4250 6950 4250
Wire Wire Line
	6200 4850 8100 4850
Wire Wire Line
	7900 3450 7900 3650
Connection ~ 7900 4850
Wire Wire Line
	7600 4550 7600 6500
Wire Wire Line
	7300 3650 7300 3450
Connection ~ 7300 3450
Wire Wire Line
	7600 3650 7600 3450
Connection ~ 7600 3450
Wire Wire Line
	6200 3850 6300 3850
Connection ~ 7050 3450
Connection ~ 5300 3850
Wire Wire Line
	3600 2550 3600 4350
Wire Wire Line
	3600 3450 3750 3450
Wire Wire Line
	3800 3850 3600 3850
Connection ~ 3600 3850
Wire Wire Line
	4350 3450 7900 3450
Wire Wire Line
	7900 4850 7900 4550
Wire Wire Line
	7600 6500 11150 6500
Connection ~ 7600 4650
Wire Wire Line
	7300 4550 7300 6600
Wire Wire Line
	7300 6600 11150 6600
Connection ~ 6300 3850
Wire Wire Line
	6950 6800 11150 6800
Wire Wire Line
	6300 3700 6300 6900
Wire Wire Line
	6300 6900 11150 6900
Wire Wire Line
	11950 6500 12400 6500
Wire Wire Line
	11950 6600 12400 6600
Wire Wire Line
	11950 6700 12400 6700
Wire Wire Line
	11950 6800 12400 6800
Wire Wire Line
	11950 6900 12400 6900
Wire Wire Line
	11950 7000 12400 7000
Wire Wire Line
	6200 4150 6900 4150
Wire Wire Line
	11150 7000 4300 7000
Wire Wire Line
	4300 7000 4300 4450
Wire Wire Line
	4300 4450 5400 4450
Wire Wire Line
	6950 4250 6950 5950
Wire Wire Line
	6950 6800 6950 6450
Wire Wire Line
	6200 4050 7150 4050
Wire Wire Line
	7150 4050 7150 6700
Wire Wire Line
	7150 6700 11150 6700
Wire Wire Line
	6950 5950 7050 5950
Wire Wire Line
	7050 3450 7050 5450
Connection ~ 7050 4050
$Comp
L CONN_2X2 P?
U 1 1 531CA23F
P 11550 2600
F 0 "P?" H 11550 2750 50  0000 C CNN
F 1 "CONN_2X2" H 11560 2470 40  0000 C CNN
F 2 "" H 11550 2600 60  0000 C CNN
F 3 "" H 11550 2600 60  0000 C CNN
	1    11550 2600
	1    0    0    -1  
$EndComp
Text Notes 11950 2350 2    60   ~ 0
Lock Timer Button
Wire Wire Line
	3600 2550 11150 2550
Connection ~ 3600 3450
Wire Wire Line
	11150 2650 4500 2650
Wire Wire Line
	4500 2650 4500 3450
Connection ~ 4500 3450
$EndSCHEMATC
