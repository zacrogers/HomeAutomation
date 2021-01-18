#include "main.h"

const uint8_t ANALOG_PIN = A0;
const uint8_t MUX_A = D5;
const uint8_t MUX_B = D7;

int light = 0;
float temperature = 0;
float humidity = 0;

DHTesp dht;

ESP8266WebServer server(80);
WiFiManager wm;

void setup() 
{
	dht.setup(D6, DHTesp::DHT11);
	pinMode(MUX_A, OUTPUT);
	pinMode(MUX_B, OUTPUT);
	digitalWrite(MUX_A, 0);
	digitalWrite(MUX_B, 0);

	Serial.begin(115200);

	wm.setConfigPortalBlocking(false);
	// wm.resetSettings();	

	WiFi.mode(WIFI_STA);

    if(wm.autoConnect("SensorNodeAp"))
	{
		Serial.println("Connected to wifi");
    }
    else 
	{
        Serial.println("Configportal running");
    }

	if (MDNS.begin("esp8266")) 
	{
		Serial.println("MDNS responder started");
	}

	server.on("/", handleRoot);
	server.on("/sensors", handleSensorPage);
	server.onNotFound(handleNotFound);
	server.begin();
	Serial.println("HTTP server started");
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

void readSensors()
{
	int analog_read = 0;
	digitalWrite(MUX_A, 1);
	digitalWrite(MUX_B, 0);
	light = analogRead(ANALOG_PIN); 
	delay(100);

	digitalWrite(MUX_A, 0);
	digitalWrite(MUX_B, 0);
	analog_read = analogRead(ANALOG_PIN); 
	temperature = (analog_read * 1.0 / 1024) * 100;
	delay(100);

	humidity = dht.getHumidity();
	delay(2000);
}

void handleRoot() 
{
	server.send(200, "text/plain", "Sensor Node");
}

void handleSensorPage()
{
	readSensors();

	String page = "<HTML><HEAD><TITLE>Sensor Node</TITLE></HEAD>";

	page += "<BODY><CENTER><B>Node Sensor Data</B>";
	page += "<table class=\"sensor_values\">";
	page += "<tr><th>Light</th><th>Temperature</th><th>Humidity</th></tr>";
	page += "<tr><td>";
	page += light;
	page += "</td><td>";
	page += temperature;
	page += "</td><td>";
	page += humidity;
	page += "</td></tr></table>";
	page += "</CENTER></BODY></HTML>";

	server.send(200, "text/html", page);
}

void handleNotFound() 
{
	String message = "File Not Found\n\n";
	message += "URI: ";
	message += server.uri();
	message += "\nMethod: ";
	message += (server.method() == HTTP_GET) ? "GET" : "POST";
	message += "\nArguments: ";
	message += server.args();
	message += "\n";

	for (uint8_t i = 0; i < server.args(); i++) 
	{
		message += " " + server.argName(i) + ": " + server.arg(i) + "\n";
	}

	server.send(404, "text/plain", message);
}