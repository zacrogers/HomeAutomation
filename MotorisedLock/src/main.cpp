
#include "main.h"


WiFiClient espClient;
PubSubClient client(espClient);

unsigned long lastMsg = 0;
#define MSG_BUFFER_SIZE	(50)
char msg[MSG_BUFFER_SIZE];
int value = 0;

Servo servo;
uint8_t current_angle = MIN_ANGLE;

bool door_open_prev = false;
bool door_open = false;

bool door_locked_prev = true;
bool door_locked = true;
// in door_open = false;


void setup() 
{
	pinMode(DOOR_OPEN_PIN, INPUT);
	pinMode(BUILTIN_LED, OUTPUT);     // Initialize the BUILTIN_LED pin as an output
	servo.attach(SERVO_PIN);
	Serial.begin(115200);
	setup_wifi();
	client.setServer(MQTT_SERVER_IP, MQTT_PORT);
	client.setCallback(callback);
	client.subscribe(TOPIC_DOOR_LOCKED);
	client.subscribe(TOPIC_DOOR_OPEN);

	lock_open();
}

void loop() 
{

	if (!client.connected()) 
	{
		reconnect();
	}
	client.loop();

	
	if (digitalRead(DOOR_OPEN_PIN))
	{
		door_open = false;
	}
	else
	{
		door_open = true;
		lock_open();

	}

	// if(door_open)
	// {
	// 	lock_open();
	// }

	if(door_open_prev != door_open)
	{
		snprintf (msg, 2, "%ld", door_open);
		Serial.print("Publish message: ");
		Serial.println(msg);
		client.publish(TOPIC_DOOR_OPEN, msg);
		// if(door_open)
		// {
		// 	lock_open();
		// }
	}

	door_open_prev = door_open;

	// unsigned long now = millis();
	// if (now - lastMsg > 2000) 
	// {
	// 	lastMsg = now;
	// 	++value;
	// 	door_open_state ^= 0x01;
	// 	snprintf (msg, 2, "%ld", door_open_state);
	// 	Serial.print("Publish message: ");
	// 	Serial.println(msg);
	// 	client.publish("outTopic", msg);
	// }
}


void setup_wifi() 
{

	delay(10);
	// We start by connecting to a WiFi network
	Serial.println();
	Serial.print("Connecting to ");
	Serial.println(WIFI_SSID);

	WiFi.mode(WIFI_STA);
	WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

	while (WiFi.status() != WL_CONNECTED) 
	{
		delay(500);
		Serial.print(".");
	}

	randomSeed(micros());

	Serial.println("");
	Serial.println("WiFi connected");
	Serial.println("IP address: ");
	Serial.println(WiFi.localIP());
}

void callback(char* topic, byte* payload, unsigned int length) 
{
	Serial.print("Message arrived [");
	Serial.print(topic);
	Serial.print("] ");

	for (int i = 0; i < length; i++) 
	{
		Serial.print((char)payload[i]);
	}
	Serial.println();

	if(strcmp(TOPIC_DOOR_LOCKED, topic) == 0)
	{
		if(!door_open)
		{
			if((char)payload[0] == '1')
			{
				lock_open();
			}
			else
			{
				lock_close();
			}
		}
		// else
		// {
		// 	lock_open();
		// }
	}

	if(strcmp(TOPIC_DOOR_OPEN, topic) == 0)
	{
		// if((char)payload[0] == '1')
		// {
		// 	lock_open();
		// }
		// else
		// {
		// 	lock_close();
		// }
	}

	// Switch on the LED if an 1 was received as first character
	if ((char)payload[0] == '1') 
	{
		digitalWrite(BUILTIN_LED, LOW);   // Turn the LED on (Note that LOW is the voltage level
		// but actually the LED is on; this is because
		// it is active low on the ESP-01)
	} 
	else 
	{
		digitalWrite(BUILTIN_LED, HIGH);  // Turn the LED off by making the voltage HIGH
	}

}

void reconnect() 
{
	// Loop until we're reconnected
	while (!client.connected()) 
	{
		Serial.print("Attempting MQTT connection...");
		// Create a random client ID
		String clientId = "ESP8266Client-";
		clientId += String(random(0xffff), HEX);

		// Attempt to connect
		if (client.connect(clientId.c_str(), MQTT_USERNAME, MQTT_PASSWORD)) 
		{
			Serial.println("connected");
			// Once connected, publish an announcement...
			//   door_open ^= 0x01;
			char outVal[1];
			String(door_open).toCharArray(outVal, 1);
			client.publish("outTopic", outVal);
			// ... and resubscribe
			client.subscribe("inTopic");
			client.subscribe(TOPIC_DOOR_LOCKED);
			client.subscribe(TOPIC_DOOR_OPEN);
		} 
		else 
		{
			Serial.print("failed, rc=");
			Serial.print(client.state());
			Serial.println(" try again in 5 seconds");
			// Wait 5 seconds before retrying
			delay(5000);
		}
	}
}

void lock_open(void)
{
	if(door_locked)
	{
		for(current_angle = MIN_ANGLE; current_angle < MAX_ANGLE; current_angle++)
		{                          
			servo.write(current_angle);
			delay(SERVO_DELAY_TIME);                       
		} 	

		door_locked = false;
	}
	else
	{
		servo.write(MIN_ANGLE);
	}
}

void lock_close(void)
{
	if(!door_locked && !door_open)
	{
		for(current_angle = MAX_ANGLE; current_angle >= MIN_ANGLE; current_angle--)
		{                          
			servo.write(current_angle);
			delay(SERVO_DELAY_TIME);                       
		} 		
		
		door_locked = true;
	}
}



// #include "main.h"

// ESP8266WebServer server(80);
// WiFiManager wm;

// Servo servo;
// bool is_locked = false;
// uint8_t current_angle = MIN_ANGLE;

// WebSocketsClient client;
// MQTTPubSubClient mqtt;

// // Tone buzzer;

// void setup() 
// {
// 	// server_setup();
// 	mqtt_client_setup();
// }

// void server_setup(void)
// {
// 	Serial.begin(115200);
// 	pinMode(RED_LED_PIN, OUTPUT);
// 	pinMode(GREEN_LED_PIN, OUTPUT);

// 	// buzzer.begin(BUZZER_PIN);
// 	// buzzer.stop();

// 	wm.setConfigPortalBlocking(false);
// 	// wm.resetSettings();	// Uncomment to clear wifi credentials

// 	WiFi.mode(WIFI_STA);

//     if(wm.autoConnect("SensorNodeAp"))
// 	{
// 		Serial.println("Connected to wifi");
//     }
//     else 
// 	{
//         Serial.println("Configportal running");
//     }

// 	if (MDNS.begin("DoorLock")) 
// 	{
// 		Serial.println("MDNS responder started");
// 	}

// 	server.on("/", handle_lock_state);
// 	server.on("/open_lock", lock_open);
// 	server.on("/close_lock", lock_close);
// 	server.onNotFound(handle_not_found);
// 	server.begin();
// 	Serial.println("Server started");

// 	servo.attach(SERVO_PIN);	
// }

// void mqtt_client_setup(void)
// {
//     Serial.begin(115200);
//     WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

//     Serial.print("connecting to wifi...");
//     while (WiFi.status() != WL_CONNECTED) {
//         Serial.print(".");
//         delay(1000);
//     }
//     Serial.println(" connected!");

//     Serial.println("connecting to host...");
//     client.begin(MQTT_SERVER_IP, MQTT_PORT, "/", "mqtt");  // "mqtt" is required
//     client.setReconnectInterval(2000);

//     // initialize mqtt client
//     mqtt.begin(client);

//     Serial.print("connecting to mqtt broker...");
//     while (!mqtt.connect("DoorLock", "public", "public")) {
//         Serial.print(".");
//         delay(1000);
//     }
//     Serial.println(" connected!");

//     // subscribe callback which is called when every packet has come
//     mqtt.subscribe([](const String& topic, const String& payload, const size_t size) {
//         Serial.println("mqtt received: " + topic + " - " + payload);
//     });

//     // subscribe topic and callback which is called when /hello has come
//     mqtt.subscribe("/hello", [](const String& payload, const size_t size) {
//         Serial.print("/hello ");
//         Serial.println(payload);
//     });;	
// }

// void loop() 
// {
// 	mqtt.update();  // should be called

//     // publish message
//     static uint32_t prev_ms = millis();
//     if (millis() > prev_ms + 1000) {
//         prev_ms = millis();
//         mqtt.publish("/hello", "world");
//     }
// 	// wm.process();

// 	// if (WiFi.status() == WL_CONNECTED) 
// 	// {
// 	// 	server.handleClient();
// 	// 	MDNS.update();
// 	// }
// }

// void lock_open(void)
// {
// 	if(is_locked)
// 	{
// 		for(current_angle = MIN_ANGLE; current_angle < MAX_ANGLE; current_angle++)
// 		{                          
// 			servo.write(current_angle);
// 			delay(SERVO_DELAY_TIME);                       
// 		} 	

// 		is_locked = false;
// 	}
// }

// void lock_close(void)
// {
// 	if(!is_locked)
// 	{
// 		for(current_angle = MAX_ANGLE; current_angle >= MIN_ANGLE; current_angle--)
// 		{                          
// 			servo.write(current_angle);
// 			delay(SERVO_DELAY_TIME);                       
// 		} 		
		
// 		is_locked = true;
// 	}
// }

// void access_granted_feedback(void)
// {
// 	digitalWrite(RED_LED_PIN, LOW);

// 	for(uint8_t i = 0; i < 4; ++i)
// 	{
// 		digitalWrite(GREEN_LED_PIN, HIGH);
// 		delay(500);
// 		digitalWrite(GREEN_LED_PIN, LOW);
// 		delay(500);
// 	}

// 	digitalWrite(GREEN_LED_PIN, HIGH);
// }

// void access_denied_feedback(void)
// {
// 	digitalWrite(GREEN_LED_PIN, LOW);

// 	for(uint8_t i = 0; i < 4; ++i)
// 	{
// 		digitalWrite(RED_LED_PIN, HIGH);
// 		delay(500);
// 		digitalWrite(RED_LED_PIN, LOW);
// 		delay(500);
// 	}

// 	digitalWrite(RED_LED_PIN, HIGH);
// }