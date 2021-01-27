#ifndef _MAIN_H
#define _MAIN_H

#include <Arduino.h>
#include <Servo.h>
#include <Wire.h>
#include <SPI.h>
#include <Adafruit_PN532.h>

// Limits for servo
#define MAX_ANGLE 180
#define MIN_ANGLE 20
#define SERVO_DELAY_TIME 10

#define SERVO_PIN D7

void open_lock(void);
void close_lock(void);

#endif