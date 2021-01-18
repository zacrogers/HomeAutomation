#ifndef MAIN_H_
#define MAIN_H_

#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
// #include <DHT.h>
#include <DHTesp.h>

#include "credentials.h"

#define DHTTYPE DHT11
#define DHTPIN D6
 
enum Sensors
{
    LDR,
    TEMPERATURE,
    HUMIDITY
};


void handleRoot();
void handleNotFound();
void handleSensorPage();
void readSensors();

#endif
