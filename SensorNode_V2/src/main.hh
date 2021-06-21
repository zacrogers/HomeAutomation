#pragma once

// ESP-IDF libs
#include <esp_system.h>
#include <nvs_flash.h>
#include <driver/adc.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>

// C++ driver libs
#include "drivers/gpio.hh"
#include "drivers/wifi.hh"

using namespace z_lib::gpio;

#define pdSECOND pdMS_TO_TICKS(1000)

#define ANALOG_PIN ADC1_CH0
#define MUX_PIN_A  GPIO_NUM_22
#define MUX_PIN_B  GPIO_NUM_23

typedef struct{ float light, temp, humidity; }SensorVals;

esp_err_t  init_peripherals(void);
esp_err_t  init_wifi(void);
void sensor_task(void *pvParameter);
void mqtt_task(void *pvParameter);