#ifndef _MAIN_H
#define _MAIN_H

#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <WiFiManager.h>
#include <ESP8266mDNS.h>
#include <Servo.h>
#include <Wire.h>
// #include <Tone.h>
#include <SPI.h>
#include <Adafruit_PN532.h>
#include <stdint.h>

// Servo defines
#define MAX_ANGLE 180
#define MIN_ANGLE 20
#define SERVO_DELAY_TIME 10
#define SERVO_PIN D7

#define RED_LED_PIN 0
#define GREEN_LED_PIN 0

#define BUZZER_PIN 0

/* Servo Control */
void lock_close(void);
void lock_open(void);

/* Key access */
void access_granted(void);
void access_denied(void);
uint8_t get_key_id(void);
 
/* Web server */
void handle_lock_state(void);
void handle_not_found(void);

/* User feedback */
void access_granted_feedback(void);
void access_denied_feedback(void);

#endif