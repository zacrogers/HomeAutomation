#include "main.h"

const uint8_t ANALOG_PIN = A0;
const uint8_t MUX_A = D5;
const uint8_t MUX_B = D7;

int inputVal  = 0;        //Variable to store analog input values

int ldr_val = 0;
float tempr_val = 0;
float humid_val = 0;

const char* ssid = SSID;
const char* password = PASSWORD;

ESP8266WebServer server(80);
WiFiManager wm;

DHT dht(DHTPIN, DHTTYPE);

void setup() 
{
	pinMode(MUX_A, OUTPUT);
	pinMode(MUX_B, OUTPUT);
	digitalWrite(MUX_A, 0);
	digitalWrite(MUX_B, 0);

	Serial.begin(115200);

	wm.setConfigPortalBlocking(false);

	WiFi.mode(WIFI_STA);

    if(wm.autoConnect("SensorNodeAp"))
	{
		Serial.println("");
		Serial.print("Connected to ");
		Serial.println(ssid);
		Serial.print("IP address: ");
		Serial.println(WiFi.localIP());
    }
    else 
	{
        Serial.println("Configportal running");
    }

	if (MDNS.begin("esp8266")) 
	{
		Serial.println("MDNS responder started");
	}
	// WiFi.begin(ssid, password);
	server.on("/", handleRoot);
	server.on("/sensors", handleSensorPage);
	server.onNotFound(handleNotFound);
	server.begin();
	Serial.println("HTTP server started");


	// Serial.println("");

	// Wait for connection
	// while (WiFi.status() != WL_CONNECTED) 
	// {
	// 	delay(500);
	// 	Serial.print(".");
	// }

	// Serial.println("");
	// Serial.print("Connected to ");
	// Serial.println(ssid);
	// Serial.print("IP address: ");
	// Serial.println(WiFi.localIP());

	// if (MDNS.begin("esp8266")) 
	// {
	// 	Serial.println("MDNS responder started");
	// }

	// server.on("/", handleRoot);

	// server.on("/sensors", handleSensorPage);

	// server.onNotFound(handleNotFound);

	// server.begin();
	// Serial.println("HTTP server started");
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
	ldr_val = analogRead(ANALOG_PIN); 
	delay(100);

	digitalWrite(MUX_A, 0);
	digitalWrite(MUX_B, 0);
	analog_read = analogRead(ANALOG_PIN); 
	tempr_val = (analog_read * 1.0 / 1024) * 100;
	delay(100);

	humid_val = dht.readHumidity();
	delay(2000);
	// float mv = (analog_read/1024.0) * 3300;
	// tempr_val = mv / 10;
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
	page += ldr_val;
	page += "</td><td>";
	page += tempr_val;
	page += "</td><td>";
	page += humid_val;
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