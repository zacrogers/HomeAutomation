#include "main.h"

ESP8266WebServer server(80);
WiFiManager wm;

Servo servo;
bool is_locked = false;
uint8_t current_angle = MIN_ANGLE;

// Tone buzzer;

void setup() 
{
	Serial.begin(115200);
	pinMode(RED_LED_PIN, OUTPUT);
	pinMode(GREEN_LED_PIN, OUTPUT);

	// buzzer.begin(BUZZER_PIN);
	// buzzer.stop();

	wm.setConfigPortalBlocking(false);
	// wm.resetSettings();	// Uncomment to clear wifi credentials

	WiFi.mode(WIFI_STA);

    if(wm.autoConnect("SensorNodeAp"))
	{
		Serial.println("Connected to wifi");
    }
    else 
	{
        Serial.println("Configportal running");
    }

	if (MDNS.begin("DoorLock")) 
	{
		Serial.println("MDNS responder started");
	}

	server.on("/", handle_lock_state);
	server.onNotFound(handle_not_found);
	server.begin();
	Serial.println("Server started");

	servo.attach(SERVO_PIN);
}

void loop() 
{
	wm.process();

	if (WiFi.status() == WL_CONNECTED) 
	{
		server.handleClient();
		MDNS.update();
	}
}

void lock_open(void)
{
	if(is_locked)
	{
		for(current_angle = MIN_ANGLE; current_angle < MAX_ANGLE; current_angle++)
		{                          
			servo.write(current_angle);
			delay(SERVO_DELAY_TIME);                       
		} 	

		is_locked = false;
	}
}

void lock_close(void)
{
	if(!is_locked)
	{
		for(current_angle = MAX_ANGLE; current_angle >= MIN_ANGLE; current_angle--)
		{                          
			servo.write(current_angle);
			delay(SERVO_DELAY_TIME);                       
		} 		
		
		is_locked = true;
	}
}

void access_granted_feedback(void)
{
	digitalWrite(RED_LED_PIN, LOW);

	for(uint8_t i = 0; i < 4; ++i)
	{
		digitalWrite(GREEN_LED_PIN, HIGH);
		delay(500);
		digitalWrite(GREEN_LED_PIN, LOW);
		delay(500);
	}

	digitalWrite(GREEN_LED_PIN, HIGH);
}

void access_denied_feedback(void)
{
	digitalWrite(GREEN_LED_PIN, LOW);

	for(uint8_t i = 0; i < 4; ++i)
	{
		digitalWrite(RED_LED_PIN, HIGH);
		delay(500);
		digitalWrite(RED_LED_PIN, LOW);
		delay(500);
	}

	digitalWrite(RED_LED_PIN, HIGH);
}