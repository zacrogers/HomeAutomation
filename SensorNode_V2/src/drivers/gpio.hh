#pragma once

#include <driver/gpio.h>
#include <driver/adc.h>

namespace z_lib{
namespace gpio{

enum class PinDir
{
    INPUT,
    OUTPUT
};

class Digital
{
    public:
        enum class Mode
        {
            INPUT,
            OUTPUT
        };

        Digital(const gpio_num_t pin, Mode mode) : _pin{pin}, _mode{mode}{}
        esp_err_t init(void);
        esp_err_t set(void);
        esp_err_t clear(void);
        esp_err_t toggle(void);
        esp_err_t read(void);
        esp_err_t set_pullup(bool);
        esp_err_t set_pulldown(bool);
        esp_err_t set_interrupt_type(gpio_int_type_t);

        esp_err_t invert_logic(bool);

    private:
        const gpio_num_t _pin;
        const Mode _mode;
        const bool _inverted_logic = false;
        bool _state = false;
};

class Analog
{
    public:
        enum class AdcNum
        {
            ADC1,
            ADC2
        };
        enum class AdcChan
        {
            CH0,
            CH1,
            CH2,
            CH3,
            CH4,
            CH5,
            CH6,
            CH7,
            CH8,
            CH9
        };

        // GpioAnalog(const adc_channel_t channel) : _channel{channel}{}
        Analog(const AdcChan channel, const AdcNum adc_num, const PinDir dir) : _channel{channel}, _adc_num{adc_num}, _dir{dir}
        { 
            init(ADC_WIDTH_BIT_12, ADC_ATTEN_0db);
        }
        esp_err_t init(adc_bits_width_t width, adc_atten_t atten);
        esp_err_t set_width(adc_bits_width_t width);
        esp_err_t set_atten(adc_atten_t atten);
        uint16_t read(void);

    private:
        const AdcChan _channel;
        const AdcNum _adc_num;
        const PinDir _dir;
};
} // namespace gpio
} // namespace z_lib