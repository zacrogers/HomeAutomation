#ifndef _MAIN_H
#define _MAIN_H

#include <Arduino.h>
#include <Servo.h>
#include <Wire.h>
#include <SPI.h>
#include <Adafruit_PN532.h>
#include <stdint.h>

// Limits for servo
#define MAX_ANGLE 180
#define MIN_ANGLE 20
#define SERVO_DELAY_TIME 10

#define SERVO_PIN D7

/* Servo Control functions */
void open_lock(void);
void close_lock(void);

/* Key access functions */
void access_granted(void);
void access_denied(void);
uint8_t get_key_id(void);

#endif