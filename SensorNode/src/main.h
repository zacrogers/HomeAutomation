#ifndef MAIN_H_
#define MAIN_H_

#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <WiFiManager.h>
#include <ESP8266mDNS.h>
#include <DHTesp.h>

void handleRoot();
void handleNotFound();
void handleSensorPage();
void readSensors();

#endif
