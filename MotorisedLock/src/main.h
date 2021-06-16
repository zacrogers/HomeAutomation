#ifndef _MAIN_H
#define _MAIN_H

#include <Arduino.h>
#include <Hash.h>
#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <Servo.h>
// #include <Wire.h>
// #include <Tone.h>
// #include <SPI.h>
// #include <Adafruit_PN532.h>
#include <stdint.h>
#include "credentials.h"

// Servo defines
#define MAX_ANGLE 180
#define MIN_ANGLE 20
#define SERVO_DELAY_TIME 10
#define SERVO_PIN D7

#define RED_LED_PIN 0
#define GREEN_LED_PIN 0

#define BUZZER_PIN 0

#define DOOR_OPEN_PIN  D1

// MQTT Topics
#define TOPIC_DOOR_OPEN "door/open"
#define TOPIC_DOOR_LOCKED "door/locked"


/* Servo Control */
void lock_close(void);
void lock_open(void);

/* Key access */
void access_granted(void);
void access_denied(void);
uint8_t get_key_id(void);
 
/*mqtt client*/
void mqtt_client_setup(void);
void reconnect();
void setup_wifi();
void callback(char* topic, byte* payload, unsigned int length);


/* Web server */
void server_setup(void);
void handle_lock_state(void);
void handle_not_found(void);

/* User feedback */
void access_granted_feedback(void);
void access_denied_feedback(void);

#endif