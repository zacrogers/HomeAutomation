#include "main.hh"
#include "esp_log.h"

#define LOG_LEVEL_LOCAL ESP_LOG_VERBOSE
#define LOG_TAG "MAIN"

SensorVals sensor_vals{0};
Digital led(GPIO_NUM_0, Digital::Mode::OUTPUT);
Digital mux_pins[] = {Digital(MUX_PIN_A, Digital::Mode::OUTPUT), Digital(MUX_PIN_B, Digital::Mode::OUTPUT)};
Analog analog_in(Analog::AdcChan::CH0, Analog::AdcNum::ADC1, PinDir::INPUT);

extern "C" void app_main(void) 
{
    ESP_ERROR_CHECK(nvs_flash_init());
    ESP_ERROR_CHECK(init_peripherals());

    xTaskCreate(&sensor_task, "sensor_task", 2048, NULL, 5, NULL);
    xTaskCreate(&mqtt_task, "mqtt_task", 2048, NULL, 5, NULL);
}

esp_err_t init_peripherals(void)
{
    esp_err_t status = ESP_OK;
    status |= led.init();
    status |= mux_pins[0].init();
    status |= mux_pins[1].init();

    return status;
}

void sensor_task(void *pvParameter)
{
    while(true)
    {
        mux_pins[0].set();
        mux_pins[1].clear();
        sensor_vals.light = analog_in.read(); 
        vTaskDelay(pdMS_TO_TICKS(100));

        mux_pins[0].clear();
        mux_pins[1].clear();
        sensor_vals.temp = analog_in.read(); 
        vTaskDelay(pdMS_TO_TICKS(100));

        // sensor_vals.humidity = dht.getHumidity();
        vTaskDelay(pdMS_TO_TICKS(1500));

        ESP_LOGI(LOG_TAG, "Hello World1");
        vTaskDelay(pdSECOND);
    }
}

void mqtt_task(void *pvParameter)
{
    while(true)
    {
        led.toggle();
        ESP_LOGI(LOG_TAG, "Hello World2");
        vTaskDelay(pdSECOND);
    }
}