#include "wifi.hh"

#include <stdio.h>
#include <cstring>

namespace z_lib
{

    static char mac_addr_cstr[13]{};

    std::atomic_bool _first_call{true};
    std::mutex init_mutex{};
    std::mutex connect_mutex{};
    std::mutex state_mutex{};

    Wifi::State _state = Wifi::State::NOT_INITIALISED;
    wifi_init_config_t _wifi_init_cfg = WIFI_INIT_CONFIG_DEFAULT();
    wifi_config_t _wifi_config{};

    Wifi::Wifi(void)
    {
        if(_first_call)
        {
            if(ESP_OK ==_get_mac()) 
            {
                esp_restart();
            }
            _first_call = false;
        } 
    }

    void Wifi::event_handler(void* arg, esp_event_base_t event_base,
                                int32_t event_id, void* event_data)
    {
        if(WIFI_EVENT == event_base)
        {
            return wifi_event_handler(arg, event_base, event_id, event_data);
        }
        else if(IP_EVENT == event_base)
        {
            return ip_event_handler(arg, event_base, event_id, event_data);
        }
        else
        {
            ESP_LOGE("myWifi", "Unexpected event: %s", event_base);
        }
    }

    void Wifi::wifi_event_handler(void* arg, esp_event_base_t event_base,
                                int32_t event_id, void* event_data)
    {
        if (WIFI_EVENT == event_base)
        {
            const wifi_event_t event_type(static_cast<wifi_event_t>(event_id));

            switch(event_type)
            {
                case WIFI_EVENT_STA_START:
                {
                    std::lock_guard<std::mutex> guard(state_mutex);
                    _state = State::READY_TO_CONNECT;
                    break;
                }

                case WIFI_EVENT_STA_CONNECTED:
                {
                    std::lock_guard<std::mutex> guard(state_mutex);
                    _state = State::WAITING_FOR_IP;
                    break;
                }

                default:
                    break;
            }
        }
    }

    void Wifi::ip_event_handler(void* arg, esp_event_base_t event_base,
                                int32_t event_id, void* event_data)
    {
        if (IP_EVENT == event_base)
        {
            const ip_event_t event_type(static_cast<ip_event_t>(event_id));

            switch(event_type)
            {
                case IP_EVENT_STA_GOT_IP:
                {
                    std::lock_guard<std::mutex> guard(state_mutex);
                    _state = State::CONNECTED;
                    break;
                }

                case IP_EVENT_STA_LOST_IP:
                {
                    std::lock_guard<std::mutex> guard(state_mutex);
                    _state = State::WAITING_FOR_IP;
                    break;
                }

                default:
                    break;
            }
        }
    }

    esp_err_t Wifi::init(void)
    {
        return _init();
    }

    esp_err_t Wifi::_init(void)
    {
        std::lock_guard<std::mutex> guard(init_mutex);

        esp_err_t status = ESP_OK;

        if(State::NOT_INITIALISED == _state)
        {
            status = esp_netif_init();

            if(ESP_OK == status)
            {
                const esp_netif_t* const p_netif = esp_netif_create_default_wifi_sta();

                if(!p_netif) 
                {
                    status = ESP_FAIL;
                }
            }

            if(ESP_OK == status)
            {
                status = esp_wifi_init(&_wifi_init_cfg);
            }

            if(ESP_OK == status)
            {
                status = esp_event_handler_instance_register(WIFI_EVENT,
                                                                ESP_EVENT_ANY_ID,            
                                                                &event_handler,
                                                                nullptr,
                                                                nullptr);
            }

            if(ESP_OK == status)
            {
                status = esp_event_handler_instance_register(IP_EVENT,
                                                                ESP_EVENT_ANY_ID,            
                                                                &event_handler,
                                                                nullptr,
                                                                nullptr);
            }

            if(ESP_OK == status)
            {
                const size_t ssid_len = std::min(strlen(ssid), sizeof(_wifi_config.sta.ssid));
                memcpy(_wifi_config.sta.ssid, ssid, ssid_len);

                const size_t password_len = std::min(strlen(password), sizeof(_wifi_config.sta.password));
                memcpy(_wifi_config.sta.password, password, password_len);

                _wifi_config.sta.threshold.authmode = WIFI_AUTH_WPA2_PSK;
                _wifi_config.sta.pmf_cfg.capable = true;
                _wifi_config.sta.pmf_cfg.required = false;

                status = esp_wifi_set_config(WIFI_IF_STA, &_wifi_config);
            }      

            if(ESP_OK == status)
            {
                status = esp_wifi_start();
            }      

            if(ESP_OK == status)
            {
                _state = State::INITIALISED;
            }   

        }
        else if(State::ERROR == _state)
        {
            _state = State::NOT_INITIALISED;
        }
        return status;
    }


    esp_err_t Wifi::begin(void)
    {
        std::lock_guard<std::mutex> connect_guard(connect_mutex);

        esp_err_t status = ESP_OK;

        std::lock_guard<std::mutex> state_guard(state_mutex);

        switch (_state)
        {
        case State::READY_TO_CONNECT:
            status = esp_wifi_connect();

            if(ESP_OK == status)
                _state = State::CONNECTING;

            break;

        case State::CONNECTING:
            /* code */
            break;
        case State::WAITING_FOR_IP:
            /* code */
            break;
        case State::CONNECTED:
            /* code */
            break;
        
        case State::INITIALISED:
        case State::NOT_INITIALISED:
        case State::WAITING_FOR_CREDENTIALS:
        case State::DISCONNECTED:
        case State::ERROR:
            status = ESP_FAIL;
            break;
        }

        if(State::READY_TO_CONNECT == _state)
        {
            status = esp_wifi_connect();
        }
        // else if(State::CONNECTED)

        return status;
    }

    esp_err_t Wifi::_get_mac(void)
    {
        uint8_t mac_byte_buffer[6]{};

        const esp_err_t status = esp_efuse_mac_get_default(mac_byte_buffer);

        if(ESP_OK == status)
        {
            snprintf(mac_addr_cstr, sizeof(mac_addr_cstr), "%02X%02X%02X%02X%02X%02X", 
                mac_byte_buffer[0],
                mac_byte_buffer[1],
                mac_byte_buffer[2],
                mac_byte_buffer[3],
                mac_byte_buffer[4],
                mac_byte_buffer[5]);
        }

        return status;
    }


} // namespace z_lib