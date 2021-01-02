EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RF_Module:ESP-12F U2
U 1 1 5FE055C2
P 5400 2550
F 0 "U2" H 4950 3550 50  0000 C CNN
F 1 "ESP-12F" H 5050 3450 50  0000 C CNN
F 2 "RF_Module:ESP-12E" H 5400 2550 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 5050 2650 50  0001 C CNN
	1    5400 2550
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AMS1117-3.3 U1
U 1 1 5FE05F41
P 2450 5700
F 0 "U1" H 2450 5942 50  0000 C CNN
F 1 "AMS1117-3.3" H 2450 5851 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 2450 5900 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 2550 5450 50  0001 C CNN
	1    2450 5700
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:LM35-LP U4
U 1 1 5FE06B79
P 9600 1350
F 0 "U4" H 9271 1396 50  0000 R CNN
F 1 "LM35-LP" H 9271 1305 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 9650 1100 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm35.pdf" H 9600 1350 50  0001 C CNN
	1    9600 1350
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Optical:LDR03 R6
U 1 1 5FE078DC
P 8050 1800
F 0 "R6" H 8120 1846 50  0000 L CNN
F 1 "LDR03" H 8120 1755 50  0000 L CNN
F 2 "OptoDevice:R_LDR_10x8.5mm_P7.6mm_Vertical" V 8225 1800 50  0001 C CNN
F 3 "http://www.elektronica-componenten.nl/WebRoot/StoreNL/Shops/61422969/54F1/BA0C/C664/31B9/2173/C0A8/2AB9/2AEF/LDR03IMP.pdf" H 8050 1750 50  0001 C CNN
	1    8050 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5FE08050
P 8050 2250
F 0 "R7" H 8120 2296 50  0000 L CNN
F 1 "220r" H 8120 2205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7980 2250 50  0001 C CNN
F 3 "~" H 8050 2250 50  0001 C CNN
	1    8050 2250
	1    0    0    -1  
$EndComp
$Comp
L Sensor:DHT11 U5
U 1 1 5FE085F7
P 9600 2500
F 0 "U5" H 9356 2546 50  0000 R CNN
F 1 "DHT11" H 9356 2455 50  0000 R CNN
F 2 "Sensor:Aosong_DHT11_5.5x12.0_P2.54mm" H 9600 2100 50  0001 C CNN
F 3 "http://akizukidenshi.com/download/ds/aosong/DHT11.pdf" H 9750 2750 50  0001 C CNN
	1    9600 2500
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:CD4051B U3
U 1 1 5FE08DD0
P 5400 5250
F 0 "U3" H 5050 6150 50  0000 C CNN
F 1 "CD4051B" H 5150 6050 50  0000 C CNN
F 2 "Package_SO:SOP-16_4.55x10.3mm_P1.27mm" H 5550 4500 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd4052b.pdf" H 5380 5350 50  0001 C CNN
	1    5400 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J2
U 1 1 5FE0F4A0
P 7750 5750
F 0 "J2" H 7858 6031 50  0000 C CNN
F 1 "FTDI" H 7858 5940 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 7750 5750 50  0001 C CNN
F 3 "~" H 7750 5750 50  0001 C CNN
	1    7750 5750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J4
U 1 1 5FE12152
P 9100 5850
F 0 "J4" H 9000 5500 50  0000 L CNN
F 1 "ProgJump" H 8350 5600 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9100 5850 50  0001 C CNN
F 3 "~" H 9100 5850 50  0001 C CNN
	1    9100 5850
	-1   0    0    1   
$EndComp
Text GLabel 7950 5950 2    50   Input ~ 0
+3.3V
Text GLabel 7950 5850 2    50   Input ~ 0
GND
Text GLabel 7950 5750 2    50   Input ~ 0
TX
Text GLabel 7950 5650 2    50   Input ~ 0
RX
$Comp
L Switch:SW_Push_Dual SW1
U 1 1 5FE1B074
P 2100 2150
F 0 "SW1" H 2100 2435 50  0000 C CNN
F 1 "ResetButton" H 2100 2344 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H8.5mm" H 2100 2350 50  0001 C CNN
F 3 "~" H 2100 2350 50  0001 C CNN
	1    2100 2150
	1    0    0    -1  
$EndComp
Text GLabel 10000 5950 2    50   Input ~ 0
+3.3V
Text GLabel 9300 5750 2    50   Input ~ 0
GND
Text GLabel 9300 5850 2    50   Input ~ 0
GPIO_0
Wire Wire Line
	10000 5950 9900 5950
Text GLabel 4800 5150 0    50   Input ~ 0
ADC
Wire Wire Line
	4800 5150 4900 5150
Wire Wire Line
	5400 5950 5300 5950
Wire Wire Line
	4900 5950 4900 5250
Wire Wire Line
	4900 5950 5300 5950
Connection ~ 5300 5950
$Comp
L power:GND #PWR0101
U 1 1 5FE2793D
P 4900 5950
F 0 "#PWR0101" H 4900 5700 50  0001 C CNN
F 1 "GND" H 4905 5777 50  0000 C CNN
F 2 "" H 4900 5950 50  0001 C CNN
F 3 "" H 4900 5950 50  0001 C CNN
	1    4900 5950
	1    0    0    -1  
$EndComp
Connection ~ 4900 5950
Text GLabel 6000 5050 2    50   Input ~ 0
TempOut
Text GLabel 6000 5150 2    50   Input ~ 0
LDROut
Wire Wire Line
	6000 5050 5900 5050
Wire Wire Line
	6000 5150 5900 5150
Text GLabel 10100 1350 2    50   Input ~ 0
TempOut
Wire Wire Line
	10100 1350 10000 1350
$Comp
L power:GND #PWR0102
U 1 1 5FE2DD50
P 8050 2400
F 0 "#PWR0102" H 8050 2150 50  0001 C CNN
F 1 "GND" H 8055 2227 50  0000 C CNN
F 2 "" H 8050 2400 50  0001 C CNN
F 3 "" H 8050 2400 50  0001 C CNN
	1    8050 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 2100 8050 2000
$Comp
L power:+3.3V #PWR0103
U 1 1 5FE2FD26
P 8050 1650
F 0 "#PWR0103" H 8050 1500 50  0001 C CNN
F 1 "+3.3V" H 8065 1823 50  0000 C CNN
F 2 "" H 8050 1650 50  0001 C CNN
F 3 "" H 8050 1650 50  0001 C CNN
	1    8050 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0104
U 1 1 5FE320EC
P 5400 1750
F 0 "#PWR0104" H 5400 1600 50  0001 C CNN
F 1 "+3.3V" H 5415 1923 50  0000 C CNN
F 2 "" H 5400 1750 50  0001 C CNN
F 3 "" H 5400 1750 50  0001 C CNN
	1    5400 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5FE35B54
P 5400 3300
F 0 "#PWR0105" H 5400 3050 50  0001 C CNN
F 1 "GND" H 5405 3127 50  0000 C CNN
F 2 "" H 5400 3300 50  0001 C CNN
F 3 "" H 5400 3300 50  0001 C CNN
	1    5400 3300
	1    0    0    -1  
$EndComp
Text GLabel 6100 2050 2    50   Input ~ 0
TX
Text GLabel 6100 2250 2    50   Input ~ 0
RX
Text GLabel 6100 1950 2    50   Input ~ 0
GPIO_0
Text GLabel 4700 2350 0    50   Input ~ 0
ADC
Text GLabel 4700 1950 0    50   Input ~ 0
RST
Text GLabel 2550 2150 2    50   Input ~ 0
RST
Wire Wire Line
	5400 3300 5400 3250
$Comp
L power:GND #PWR0106
U 1 1 5FE428FB
P 9600 1650
F 0 "#PWR0106" H 9600 1400 50  0001 C CNN
F 1 "GND" H 9605 1477 50  0000 C CNN
F 2 "" H 9600 1650 50  0001 C CNN
F 3 "" H 9600 1650 50  0001 C CNN
	1    9600 1650
	1    0    0    -1  
$EndComp
Text GLabel 8150 2000 2    50   Input ~ 0
LDROut
Wire Wire Line
	8150 2000 8050 2000
Connection ~ 8050 2000
Wire Wire Line
	8050 2000 8050 1950
$Comp
L power:GND #PWR0107
U 1 1 5FE46EA5
P 4800 4950
F 0 "#PWR0107" H 4800 4700 50  0001 C CNN
F 1 "GND" V 4805 4822 50  0000 R CNN
F 2 "" H 4800 4950 50  0001 C CNN
F 3 "" H 4800 4950 50  0001 C CNN
	1    4800 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 4950 4900 4950
$Comp
L power:+3.3V #PWR0108
U 1 1 5FE489A8
P 5500 4450
F 0 "#PWR0108" H 5500 4300 50  0001 C CNN
F 1 "+3.3V" H 5515 4623 50  0000 C CNN
F 2 "" H 5500 4450 50  0001 C CNN
F 3 "" H 5500 4450 50  0001 C CNN
	1    5500 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4450 5500 4550
Text GLabel 6000 5250 2    50   Input ~ 0
SensorC
Wire Wire Line
	6000 5250 5900 5250
Text GLabel 6000 5350 2    50   Input ~ 0
SensorD
Wire Wire Line
	6000 5350 5900 5350
Text GLabel 4800 4750 0    50   Input ~ 0
MuxA
Text GLabel 4800 4850 0    50   Input ~ 0
MuxB
Wire Wire Line
	4800 4850 4900 4850
Wire Wire Line
	4800 4750 4900 4750
Wire Wire Line
	5400 5950 5900 5950
Wire Wire Line
	5900 5950 5900 5750
Connection ~ 5400 5950
Connection ~ 5900 5550
Wire Wire Line
	5900 5550 5900 5450
Connection ~ 5900 5650
Wire Wire Line
	5900 5650 5900 5550
Connection ~ 5900 5750
Wire Wire Line
	5900 5750 5900 5650
Text GLabel 6100 2750 2    50   Input ~ 0
MuxA
Text GLabel 6100 2650 2    50   Input ~ 0
MuxB
$Comp
L Connector:USB_B_Micro J1
U 1 1 5FE5296C
P 2450 4350
F 0 "J1" H 2507 4817 50  0000 C CNN
F 1 "USB_B_Micro" H 2507 4726 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Molex-105017-0001" H 2600 4300 50  0001 C CNN
F 3 "~" H 2600 4300 50  0001 C CNN
	1    2450 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4750 2400 4750
$Comp
L power:+5V #PWR0109
U 1 1 5FE56E81
P 2850 4150
F 0 "#PWR0109" H 2850 4000 50  0001 C CNN
F 1 "+5V" V 2865 4278 50  0000 L CNN
F 2 "" H 2850 4150 50  0001 C CNN
F 3 "" H 2850 4150 50  0001 C CNN
	1    2850 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	2850 4150 2750 4150
$Comp
L power:GND #PWR0110
U 1 1 5FE57CC6
P 2400 4750
F 0 "#PWR0110" H 2400 4500 50  0001 C CNN
F 1 "GND" H 2405 4577 50  0000 C CNN
F 2 "" H 2400 4750 50  0001 C CNN
F 3 "" H 2400 4750 50  0001 C CNN
	1    2400 4750
	1    0    0    -1  
$EndComp
Connection ~ 2400 4750
Wire Wire Line
	2400 4750 2450 4750
$Comp
L power:+5V #PWR0111
U 1 1 5FE6411F
P 1550 5700
F 0 "#PWR0111" H 1550 5550 50  0001 C CNN
F 1 "+5V" V 1565 5828 50  0000 L CNN
F 2 "" H 1550 5700 50  0001 C CNN
F 3 "" H 1550 5700 50  0001 C CNN
	1    1550 5700
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0112
U 1 1 5FE652B0
P 3300 5700
F 0 "#PWR0112" H 3300 5550 50  0001 C CNN
F 1 "+3.3V" V 3315 5828 50  0000 L CNN
F 2 "" H 3300 5700 50  0001 C CNN
F 3 "" H 3300 5700 50  0001 C CNN
	1    3300 5700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5FE67298
P 2450 6150
F 0 "#PWR0113" H 2450 5900 50  0001 C CNN
F 1 "GND" H 2455 5977 50  0000 C CNN
F 2 "" H 2450 6150 50  0001 C CNN
F 3 "" H 2450 6150 50  0001 C CNN
	1    2450 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 6150 2450 6100
Wire Wire Line
	2300 2350 2300 2150
Connection ~ 2300 2150
Wire Wire Line
	2300 2150 2450 2150
Wire Wire Line
	1900 2350 1900 2150
$Comp
L power:GND #PWR0114
U 1 1 5FE71E47
P 1900 2350
F 0 "#PWR0114" H 1900 2100 50  0001 C CNN
F 1 "GND" H 1905 2177 50  0000 C CNN
F 2 "" H 1900 2350 50  0001 C CNN
F 3 "" H 1900 2350 50  0001 C CNN
	1    1900 2350
	1    0    0    -1  
$EndComp
Connection ~ 1900 2350
Wire Wire Line
	4700 2350 4800 2350
Wire Wire Line
	4700 1950 4800 1950
Wire Wire Line
	6000 1950 6100 1950
Wire Wire Line
	6000 2050 6100 2050
Wire Wire Line
	6000 2250 6100 2250
$Comp
L power:+5V #PWR0115
U 1 1 5FE7F6C6
P 9600 1000
F 0 "#PWR0115" H 9600 850 50  0001 C CNN
F 1 "+5V" H 9615 1173 50  0000 C CNN
F 2 "" H 9600 1000 50  0001 C CNN
F 3 "" H 9600 1000 50  0001 C CNN
	1    9600 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 1000 9600 1050
$Comp
L Device:R R1
U 1 1 5FEBBF31
P 2450 1950
F 0 "R1" H 2520 1996 50  0000 L CNN
F 1 "10k" H 2520 1905 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 2380 1950 50  0001 C CNN
F 3 "~" H 2450 1950 50  0001 C CNN
	1    2450 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0116
U 1 1 5FEBCC38
P 2450 1750
F 0 "#PWR0116" H 2450 1600 50  0001 C CNN
F 1 "+3.3V" H 2465 1923 50  0000 C CNN
F 2 "" H 2450 1750 50  0001 C CNN
F 3 "" H 2450 1750 50  0001 C CNN
	1    2450 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1800 2450 1750
Wire Wire Line
	2450 2100 2450 2150
Connection ~ 2450 2150
Wire Wire Line
	2450 2150 2550 2150
Wire Wire Line
	6100 2650 6000 2650
Wire Wire Line
	6000 2750 6100 2750
$Comp
L power:+5V #PWR0117
U 1 1 5FEED1AB
P 9600 2200
F 0 "#PWR0117" H 9600 2050 50  0001 C CNN
F 1 "+5V" H 9615 2373 50  0000 C CNN
F 2 "" H 9600 2200 50  0001 C CNN
F 3 "" H 9600 2200 50  0001 C CNN
	1    9600 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5FEEE623
P 9600 2800
F 0 "#PWR0118" H 9600 2550 50  0001 C CNN
F 1 "GND" H 9605 2627 50  0000 C CNN
F 2 "" H 9600 2800 50  0001 C CNN
F 3 "" H 9600 2800 50  0001 C CNN
	1    9600 2800
	1    0    0    -1  
$EndComp
Text GLabel 10250 2500 2    50   Input ~ 0
DHTOut
Text GLabel 6100 2550 2    50   Input ~ 0
DHTOut
Wire Wire Line
	6100 2550 6000 2550
$Comp
L Device:R R5
U 1 1 5FEF5AC2
P 6650 2000
F 0 "R5" H 6720 2046 50  0000 L CNN
F 1 "10k" H 6720 1955 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 6580 2000 50  0001 C CNN
F 3 "~" H 6650 2000 50  0001 C CNN
	1    6650 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 2150 6000 2150
Wire Wire Line
	6650 1850 6650 1750
Wire Wire Line
	6650 1750 5400 1750
Connection ~ 5400 1750
$Comp
L Device:R R4
U 1 1 5FEF8B74
P 6400 3050
F 0 "R4" H 6470 3096 50  0000 L CNN
F 1 "10k" H 6470 3005 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 6330 3050 50  0001 C CNN
F 3 "~" H 6400 3050 50  0001 C CNN
	1    6400 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5FF02B53
P 6200 4550
F 0 "C5" H 6315 4596 50  0000 L CNN
F 1 "0.1u" H 6315 4505 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6238 4400 50  0001 C CNN
F 3 "~" H 6200 4550 50  0001 C CNN
	1    6200 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5FF0ED73
P 2900 5950
F 0 "C3" H 3015 5996 50  0000 L CNN
F 1 "0.1u" H 3015 5905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2938 5800 50  0001 C CNN
F 3 "~" H 2900 5950 50  0001 C CNN
	1    2900 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5FF10059
P 3300 5950
F 0 "C4" H 3415 5996 50  0000 L CNN
F 1 "0.1u" H 3415 5905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3338 5800 50  0001 C CNN
F 3 "~" H 3300 5950 50  0001 C CNN
	1    3300 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 6100 2900 6100
Connection ~ 2450 6100
Wire Wire Line
	2450 6100 2450 6000
Connection ~ 2900 6100
Wire Wire Line
	2900 6100 2450 6100
Wire Wire Line
	2900 5700 2900 5800
Wire Wire Line
	2750 5700 2900 5700
Wire Wire Line
	2900 5700 3300 5700
Wire Wire Line
	3300 5700 3300 5800
Connection ~ 2900 5700
Connection ~ 3300 5700
$Comp
L power:GND #PWR0119
U 1 1 5FF2735E
P 6200 4700
F 0 "#PWR0119" H 6200 4450 50  0001 C CNN
F 1 "GND" H 6205 4527 50  0000 C CNN
F 2 "" H 6200 4700 50  0001 C CNN
F 3 "" H 6200 4700 50  0001 C CNN
	1    6200 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0120
U 1 1 5FF297DA
P 6200 4400
F 0 "#PWR0120" H 6200 4250 50  0001 C CNN
F 1 "+3.3V" H 6215 4573 50  0000 C CNN
F 2 "" H 6200 4400 50  0001 C CNN
F 3 "" H 6200 4400 50  0001 C CNN
	1    6200 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5FF38198
P 1650 5950
F 0 "C1" H 1765 5996 50  0000 L CNN
F 1 "0.1u" H 1765 5905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1688 5800 50  0001 C CNN
F 3 "~" H 1650 5950 50  0001 C CNN
	1    1650 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5FF3819E
P 2050 5950
F 0 "C2" H 2165 5996 50  0000 L CNN
F 1 "0.1u" H 2165 5905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2088 5800 50  0001 C CNN
F 3 "~" H 2050 5950 50  0001 C CNN
	1    2050 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 6100 2050 6100
Connection ~ 2050 6100
Wire Wire Line
	2050 6100 2450 6100
Wire Wire Line
	2050 5800 2050 5700
Connection ~ 2050 5700
Wire Wire Line
	2050 5700 2150 5700
Wire Wire Line
	1550 5700 1650 5700
Wire Wire Line
	1650 5800 1650 5700
Connection ~ 1650 5700
Wire Wire Line
	1650 5700 2050 5700
$Comp
L Device:R R2
U 1 1 5FF4648C
P 4350 2150
F 0 "R2" V 4143 2150 50  0000 C CNN
F 1 "10k" V 4234 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4280 2150 50  0001 C CNN
F 3 "~" H 4350 2150 50  0001 C CNN
	1    4350 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 2150 4500 2150
Wire Wire Line
	4200 2150 4200 1750
Wire Wire Line
	4200 1750 5400 1750
$Comp
L Device:R R8
U 1 1 5FF52984
P 9750 5950
F 0 "R8" V 9543 5950 50  0000 C CNN
F 1 "10k" V 9634 5950 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9680 5950 50  0001 C CNN
F 3 "~" H 9750 5950 50  0001 C CNN
	1    9750 5950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5FF5F838
P 6400 3300
F 0 "#PWR0121" H 6400 3050 50  0001 C CNN
F 1 "GND" H 6405 3127 50  0000 C CNN
F 2 "" H 6400 3300 50  0001 C CNN
F 3 "" H 6400 3300 50  0001 C CNN
	1    6400 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5FF614F9
P 6100 3100
F 0 "R3" H 6170 3146 50  0000 L CNN
F 1 "10k" H 6170 3055 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 6030 3100 50  0001 C CNN
F 3 "~" H 6100 3100 50  0001 C CNN
	1    6100 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3250 6100 3300
Wire Wire Line
	6400 2850 6400 2900
Wire Wire Line
	6000 2850 6400 2850
Wire Wire Line
	6400 3300 6400 3200
Wire Wire Line
	6000 2950 6100 2950
$Comp
L power:+3.3V #PWR0122
U 1 1 5FF7A598
P 6100 3300
F 0 "#PWR0122" H 6100 3150 50  0001 C CNN
F 1 "+3.3V" H 6115 3473 50  0000 C CNN
F 2 "" H 6100 3300 50  0001 C CNN
F 3 "" H 6100 3300 50  0001 C CNN
	1    6100 3300
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x08_Male J3
U 1 1 5FF8B1D3
P 7900 4400
F 0 "J3" H 8008 4881 50  0000 C CNN
F 1 "ExtraPins" H 8008 4790 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 7900 4400 50  0001 C CNN
F 3 "~" H 7900 4400 50  0001 C CNN
	1    7900 4400
	1    0    0    -1  
$EndComp
Text GLabel 8100 4100 2    50   Input ~ 0
SDA
Text GLabel 8100 4200 2    50   Input ~ 0
SCL
Text GLabel 8100 4300 2    50   Input ~ 0
CSO
Text GLabel 8100 4400 2    50   Input ~ 0
MISO
Text GLabel 8100 4500 2    50   Input ~ 0
GPIO9
Text GLabel 8100 4600 2    50   Input ~ 0
GPIO10
Text GLabel 8100 4700 2    50   Input ~ 0
MOSI
Text GLabel 8100 4800 2    50   Input ~ 0
SCLK
Text GLabel 6100 2350 2    50   Input ~ 0
SDA
Text GLabel 6100 2450 2    50   Input ~ 0
SCL
Wire Wire Line
	6100 2350 6000 2350
Wire Wire Line
	6000 2450 6100 2450
Text GLabel 4700 2550 0    50   Input ~ 0
CSO
Text GLabel 4700 2650 0    50   Input ~ 0
MISO
Text GLabel 4700 2750 0    50   Input ~ 0
GPIO9
Text GLabel 4700 2850 0    50   Input ~ 0
GPIO10
Text GLabel 4700 2950 0    50   Input ~ 0
MOSI
Text GLabel 4700 3050 0    50   Input ~ 0
SCLK
Wire Wire Line
	4800 3050 4700 3050
Wire Wire Line
	4700 2950 4800 2950
Wire Wire Line
	4700 2850 4800 2850
Wire Wire Line
	4700 2750 4800 2750
Wire Wire Line
	4700 2650 4800 2650
Wire Wire Line
	4800 2550 4700 2550
Wire Wire Line
	9600 5950 9300 5950
$Comp
L Connector:Conn_01x03_Female J5
U 1 1 60024887
P 9300 4850
F 0 "J5" H 9192 4525 50  0000 C CNN
F 1 "PWR" H 9192 4616 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 9300 4850 50  0001 C CNN
F 3 "~" H 9300 4850 50  0001 C CNN
	1    9300 4850
	-1   0    0    1   
$EndComp
Text GLabel 9500 4750 2    50   Input ~ 0
+5V
Text GLabel 9500 4850 2    50   Input ~ 0
+3.3V
Text GLabel 9500 4950 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x02_Female J6
U 1 1 60032BEF
P 9250 4250
F 0 "J6" H 9142 3925 50  0000 C CNN
F 1 "MuxExtra" H 9142 4016 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9250 4250 50  0001 C CNN
F 3 "~" H 9250 4250 50  0001 C CNN
	1    9250 4250
	-1   0    0    1   
$EndComp
Text GLabel 9450 4150 2    50   Input ~ 0
SensorC
Text GLabel 9450 4250 2    50   Input ~ 0
SensorD
$Comp
L Device:R R9
U 1 1 60075C43
P 10050 2350
F 0 "R9" H 10120 2396 50  0000 L CNN
F 1 "10k" H 10120 2305 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 9980 2350 50  0001 C CNN
F 3 "~" H 10050 2350 50  0001 C CNN
	1    10050 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 2500 10050 2500
Connection ~ 10050 2500
Wire Wire Line
	10050 2500 9900 2500
Wire Wire Line
	10050 2200 9600 2200
Connection ~ 9600 2200
$EndSCHEMATC
