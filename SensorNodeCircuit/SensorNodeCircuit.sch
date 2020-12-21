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
L RF_Module:ESP-12F U?
U 1 1 5FE055C2
P 5400 2550
F 0 "U?" H 4950 3550 50  0000 C CNN
F 1 "ESP-12F" H 5050 3450 50  0000 C CNN
F 2 "RF_Module:ESP-12E" H 5400 2550 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 5050 2650 50  0001 C CNN
	1    5400 2550
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AMS1117-3.3 U?
U 1 1 5FE05F41
P 2450 5700
F 0 "U?" H 2450 5942 50  0000 C CNN
F 1 "AMS1117-3.3" H 2450 5851 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 2450 5900 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 2550 5450 50  0001 C CNN
	1    2450 5700
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:LM35-LP U?
U 1 1 5FE06B79
P 9450 2200
F 0 "U?" H 9121 2246 50  0000 R CNN
F 1 "LM35-LP" H 9121 2155 50  0000 R CNN
F 2 "" H 9500 1950 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm35.pdf" H 9450 2200 50  0001 C CNN
	1    9450 2200
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Optical:LDR03 R?
U 1 1 5FE078DC
P 7900 2650
F 0 "R?" H 7970 2696 50  0000 L CNN
F 1 "LDR03" H 7970 2605 50  0000 L CNN
F 2 "OptoDevice:R_LDR_10x8.5mm_P7.6mm_Vertical" V 8075 2650 50  0001 C CNN
F 3 "http://www.elektronica-componenten.nl/WebRoot/StoreNL/Shops/61422969/54F1/BA0C/C664/31B9/2173/C0A8/2AB9/2AEF/LDR03IMP.pdf" H 7900 2600 50  0001 C CNN
	1    7900 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FE08050
P 7900 3100
F 0 "R?" H 7970 3146 50  0000 L CNN
F 1 "R" H 7970 3055 50  0000 L CNN
F 2 "" V 7830 3100 50  0001 C CNN
F 3 "~" H 7900 3100 50  0001 C CNN
	1    7900 3100
	1    0    0    -1  
$EndComp
$Comp
L Sensor:DHT11 U?
U 1 1 5FE085F7
P 9450 3650
F 0 "U?" H 9206 3696 50  0000 R CNN
F 1 "DHT11" H 9206 3605 50  0000 R CNN
F 2 "Sensor:Aosong_DHT11_5.5x12.0_P2.54mm" H 9450 3250 50  0001 C CNN
F 3 "http://akizukidenshi.com/download/ds/aosong/DHT11.pdf" H 9600 3900 50  0001 C CNN
	1    9450 3650
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:CD4051B U?
U 1 1 5FE08DD0
P 5400 5250
F 0 "U?" H 5050 6150 50  0000 C CNN
F 1 "CD4051B" H 5150 6050 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5550 4500 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd4052b.pdf" H 5380 5350 50  0001 C CNN
	1    5400 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 5FE0F4A0
P 8950 5700
F 0 "J?" H 9058 5981 50  0000 C CNN
F 1 "ProgrammingHeader" H 9058 5890 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 8950 5700 50  0001 C CNN
F 3 "~" H 8950 5700 50  0001 C CNN
	1    8950 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J?
U 1 1 5FE12152
P 8950 5050
F 0 "J?" H 8978 5076 50  0000 L CNN
F 1 "ProgrammingJumper" H 8978 4985 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 8950 5050 50  0001 C CNN
F 3 "~" H 8950 5050 50  0001 C CNN
	1    8950 5050
	-1   0    0    1   
$EndComp
Text GLabel 9250 5900 2    50   Input ~ 0
+3.3V
Text GLabel 9250 5800 2    50   Input ~ 0
GND
Text GLabel 9250 5700 2    50   Input ~ 0
TX
Text GLabel 9250 5600 2    50   Input ~ 0
RX
$Comp
L Switch:SW_Push_Dual SW?
U 1 1 5FE1B074
P 2100 2150
F 0 "SW?" H 2100 2435 50  0000 C CNN
F 1 "ResetButton" H 2100 2344 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H8mm" H 2100 2350 50  0001 C CNN
F 3 "~" H 2100 2350 50  0001 C CNN
	1    2100 2150
	1    0    0    -1  
$EndComp
Text GLabel 9250 5150 2    50   Input ~ 0
+3.3V
Text GLabel 9250 4950 2    50   Input ~ 0
GND
Text GLabel 9250 5050 2    50   Input ~ 0
GPIO_0
Wire Wire Line
	9250 5150 9150 5150
Wire Wire Line
	9150 5050 9250 5050
Wire Wire Line
	9250 4950 9150 4950
Wire Wire Line
	9250 5600 9150 5600
Wire Wire Line
	9150 5700 9250 5700
Wire Wire Line
	9150 5800 9250 5800
Wire Wire Line
	9150 5900 9250 5900
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
L power:GND #PWR?
U 1 1 5FE2793D
P 4900 5950
F 0 "#PWR?" H 4900 5700 50  0001 C CNN
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
Text GLabel 9950 2200 2    50   Input ~ 0
TempOut
Wire Wire Line
	9950 2200 9850 2200
$Comp
L power:GND #PWR?
U 1 1 5FE2DD50
P 7900 3250
F 0 "#PWR?" H 7900 3000 50  0001 C CNN
F 1 "GND" H 7905 3077 50  0000 C CNN
F 2 "" H 7900 3250 50  0001 C CNN
F 3 "" H 7900 3250 50  0001 C CNN
	1    7900 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 2950 7900 2850
$Comp
L power:+3.3V #PWR?
U 1 1 5FE2FD26
P 7900 2500
F 0 "#PWR?" H 7900 2350 50  0001 C CNN
F 1 "+3.3V" H 7915 2673 50  0000 C CNN
F 2 "" H 7900 2500 50  0001 C CNN
F 3 "" H 7900 2500 50  0001 C CNN
	1    7900 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5FE320EC
P 5400 1750
F 0 "#PWR?" H 5400 1600 50  0001 C CNN
F 1 "+3.3V" H 5415 1923 50  0000 C CNN
F 2 "" H 5400 1750 50  0001 C CNN
F 3 "" H 5400 1750 50  0001 C CNN
	1    5400 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FE35B54
P 5400 3300
F 0 "#PWR?" H 5400 3050 50  0001 C CNN
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
L power:GND #PWR?
U 1 1 5FE428FB
P 9450 2500
F 0 "#PWR?" H 9450 2250 50  0001 C CNN
F 1 "GND" H 9455 2327 50  0000 C CNN
F 2 "" H 9450 2500 50  0001 C CNN
F 3 "" H 9450 2500 50  0001 C CNN
	1    9450 2500
	1    0    0    -1  
$EndComp
Text GLabel 8000 2850 2    50   Input ~ 0
LDROut
Wire Wire Line
	8000 2850 7900 2850
Connection ~ 7900 2850
Wire Wire Line
	7900 2850 7900 2800
$Comp
L power:GND #PWR?
U 1 1 5FE46EA5
P 4800 4950
F 0 "#PWR?" H 4800 4700 50  0001 C CNN
F 1 "GND" V 4805 4822 50  0000 R CNN
F 2 "" H 4800 4950 50  0001 C CNN
F 3 "" H 4800 4950 50  0001 C CNN
	1    4800 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 4950 4900 4950
$Comp
L power:+3.3V #PWR?
U 1 1 5FE489A8
P 5500 4450
F 0 "#PWR?" H 5500 4300 50  0001 C CNN
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
Text GLabel 6700 2600 0    50   Input ~ 0
MuxA
Text GLabel 6700 2700 0    50   Input ~ 0
MuxB
$Comp
L Connector:USB_B_Micro J?
U 1 1 5FE5296C
P 2450 4350
F 0 "J?" H 2507 4817 50  0000 C CNN
F 1 "USB_B_Micro" H 2507 4726 50  0000 C CNN
F 2 "" H 2600 4300 50  0001 C CNN
F 3 "~" H 2600 4300 50  0001 C CNN
	1    2450 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4750 2400 4750
$Comp
L power:+5V #PWR?
U 1 1 5FE56E81
P 2850 4150
F 0 "#PWR?" H 2850 4000 50  0001 C CNN
F 1 "+5V" V 2865 4278 50  0000 L CNN
F 2 "" H 2850 4150 50  0001 C CNN
F 3 "" H 2850 4150 50  0001 C CNN
	1    2850 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	2850 4150 2750 4150
$Comp
L power:GND #PWR?
U 1 1 5FE57CC6
P 2400 4750
F 0 "#PWR?" H 2400 4500 50  0001 C CNN
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
L power:+5V #PWR?
U 1 1 5FE6411F
P 1900 5700
F 0 "#PWR?" H 1900 5550 50  0001 C CNN
F 1 "+5V" V 1915 5828 50  0000 L CNN
F 2 "" H 1900 5700 50  0001 C CNN
F 3 "" H 1900 5700 50  0001 C CNN
	1    1900 5700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1900 5700 2150 5700
$Comp
L power:+3.3V #PWR?
U 1 1 5FE652B0
P 2950 5700
F 0 "#PWR?" H 2950 5550 50  0001 C CNN
F 1 "+3.3V" V 2965 5828 50  0000 L CNN
F 2 "" H 2950 5700 50  0001 C CNN
F 3 "" H 2950 5700 50  0001 C CNN
	1    2950 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 5700 2750 5700
$Comp
L power:GND #PWR?
U 1 1 5FE67298
P 2450 6150
F 0 "#PWR?" H 2450 5900 50  0001 C CNN
F 1 "GND" H 2455 5977 50  0000 C CNN
F 2 "" H 2450 6150 50  0001 C CNN
F 3 "" H 2450 6150 50  0001 C CNN
	1    2450 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 6150 2450 6000
Wire Wire Line
	2300 2350 2300 2150
Connection ~ 2300 2150
Wire Wire Line
	2300 2150 2450 2150
Wire Wire Line
	1900 2350 1900 2150
$Comp
L power:GND #PWR?
U 1 1 5FE71E47
P 1900 2350
F 0 "#PWR?" H 1900 2100 50  0001 C CNN
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
L power:+5V #PWR?
U 1 1 5FE7F6C6
P 9450 1850
F 0 "#PWR?" H 9450 1700 50  0001 C CNN
F 1 "+5V" H 9465 2023 50  0000 C CNN
F 2 "" H 9450 1850 50  0001 C CNN
F 3 "" H 9450 1850 50  0001 C CNN
	1    9450 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 1850 9450 1900
$Comp
L Device:R R?
U 1 1 5FEBBF31
P 2450 1950
F 0 "R?" H 2520 1996 50  0000 L CNN
F 1 "10k" H 2520 1905 50  0000 L CNN
F 2 "" V 2380 1950 50  0001 C CNN
F 3 "~" H 2450 1950 50  0001 C CNN
	1    2450 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5FEBCC38
P 2450 1750
F 0 "#PWR?" H 2450 1600 50  0001 C CNN
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
$EndSCHEMATC
