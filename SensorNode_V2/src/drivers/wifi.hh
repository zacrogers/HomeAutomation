#pragma once

#include <esp_wifi.h>
#include <esp_event.h>
#include <esp_log.h>
#include <atomic>
#include <mutex>
#include <algorithm>

namespace z_lib
{
    class Wifi
    {
        constexpr static const char* ssid{"ssid"};
        constexpr static const char* password{"password"};

        public:
            enum class State
            {
                NOT_INITIALISED,
                INITIALISED,
                WAITING_FOR_CREDENTIALS,
                READY_TO_CONNECT,
                CONNECTING,
                WAITING_FOR_IP,
                CONNECTED,
                DISCONNECTED,
                ERROR
            };

            Wifi(void);
            esp_err_t init(void);
            esp_err_t begin(void);
            State get_state(void){ return _state; }
            constexpr static const char* get_mac(void){ return mac_addr_cstr; }

        private:
            static esp_err_t _init(void); 
            void state_machine(void);
            static void event_handler(void* arg, esp_event_base_t event_base,
                                        int32_t event_id, void* event_data);
            static void wifi_event_handler(void* arg, esp_event_base_t event_base,
                            int32_t event_id, void* event_data);
            static void ip_event_handler(void* arg, esp_event_base_t event_base,
                                        int32_t event_id, void* event_data);                    

            static esp_err_t _get_mac(void);

            static char mac_addr_cstr[13];
            static State _state;
            static wifi_init_config_t _wifi_init_cfg;
            static wifi_config_t _wifi_config;

            static std::atomic_bool _first_call;
            static std::mutex init_mutex;
            static std::mutex connect_mutex;
            static std::mutex state_mutex;
    };
}