#ifndef MAIN_H_
#define MAIN_H_

#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>

#include "credentials.h"

#define NUM_RELAYS 4

/* Page serving functions */
void handleRoot();
void handleRelayStates();
void handleRelay1On();
void handleRelay2On();
void handleRelay3On();
void handleRelay4On();
void handleRelay1Off();
void handleRelay2Off();
void handleRelay3Off();
void handleRelay4Off();
void handleNotFound();

void relayOn(uint8_t relay_num);
void relayOff(uint8_t relay_num);

#endif
