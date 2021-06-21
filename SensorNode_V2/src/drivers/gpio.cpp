#include "gpio.hh"

namespace z_lib
{
namespace gpio
{
    /* Digital pin */
    esp_err_t Digital::init(void)
    {
        esp_err_t status = ESP_OK;
        gpio_config_t config;

        switch (_mode)
        {
        case Mode::INPUT:
            config = {
                .pin_bit_mask = static_cast<uint64_t>(1) << _pin,
                .mode         = GPIO_MODE_INPUT,
                .pull_up_en   = GPIO_PULLUP_DISABLE,
                .pull_down_en = GPIO_PULLDOWN_DISABLE,
                .intr_type    = GPIO_INTR_DISABLE
            };
            status |= gpio_config(&config);

            break;

        case Mode::OUTPUT:
            config = {
                .pin_bit_mask = static_cast<uint64_t>(1) << _pin,
                .mode         = GPIO_MODE_OUTPUT,
                .pull_up_en   = GPIO_PULLUP_DISABLE,
                .pull_down_en = GPIO_PULLDOWN_ENABLE,
                .intr_type    = GPIO_INTR_DISABLE
            };

            status |= gpio_config(&config);

            break;

        default:
            status = ESP_FAIL;
            break;
        }

        return status;
    }

    esp_err_t Digital::set(void)
    {
        _state = _inverted_logic ? 0 : 1;
        return gpio_set_level(_pin, _state);
    }

    esp_err_t Digital::clear(void)
    {
        _state = _inverted_logic ? 1 : 0;
        return gpio_set_level(_pin, _state);
    }

    esp_err_t Digital::toggle(void)
    {
        _state ^= _state;
        return gpio_set_level(_pin, _state);
    }

    /* Analog pin */

    esp_err_t Analog::init(adc_bits_width_t width, adc_atten_t atten)
    {
        esp_err_t status = ESP_OK;
        switch (_adc_num)
        {
        case AdcNum::ADC1:               
            status |= adc1_config_width(width);
            status |= adc1_config_channel_atten(static_cast<adc1_channel_t>(_channel), atten);
            break;

        case AdcNum::ADC2:
            // _adc2_chan = ADC2_CHANNEL_0;
            break;  

        default:
            break;
        }

        return status;
    }

    esp_err_t Analog::set_width(adc_bits_width_t width)
    {
        esp_err_t status = ESP_OK;
        switch (_adc_num)
        {
            case AdcNum::ADC1:
                status |= adc1_config_width(width);
                break;

            case AdcNum::ADC2:
                // status |= adc2_config_width(width);
                break;   
                    
            default:
                break;
        }
        return status;
    }

    esp_err_t Analog::set_atten(adc_atten_t atten)
    {
        esp_err_t status = ESP_OK;
        switch (_adc_num)
        {
            case AdcNum::ADC1:
                status |= adc1_config_channel_atten(static_cast<adc1_channel_t>(_channel), atten);
                break;

            case AdcNum::ADC2:
                status |= adc2_config_channel_atten(static_cast<adc2_channel_t>(_channel), atten);
                break;   
                    
            default:
                break;
        }
        return status;
    }

    uint16_t Analog::read(void)
    {
        uint16_t raw_val = 0;
        switch (_adc_num)
        {
        case AdcNum::ADC1:
            raw_val = adc1_get_raw(static_cast<adc1_channel_t>(_channel));
            break;

        case AdcNum::ADC2:
            // if(ESP_OK != adc2_get_raw(0, ADC_WIDTH_BIT_12, &raw_val))
            // {
                
            // }
            break; 

        default:
            break;
        }
        return raw_val;
    }
}
}