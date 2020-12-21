#include "main.h"

const uint8_t RELAY_PIN[NUM_RELAYS] = {};

const char* ssid = SSID;
const char* password = PASSWORD;

ESP8266WebServer server(80);
uint8_t relay_states = 0x00;

void setup() 
{
	for(uint8_t i = 0; i < NUM_RELAYS; ++i)
	{
		pinMode(RELAY_PIN[i], OUTPUT);
		digitalWrite(RELAY_PIN[i], LOW);
	}

  	Serial.begin(115200);
	WiFi.mode(WIFI_STA);
	WiFi.begin(ssid, password);
	Serial.println("");

	// Wait for connection
	while (WiFi.status() != WL_CONNECTED) 
	{
		delay(500);
		Serial.print(".");
	}

	Serial.println("");
	Serial.print("Connected to ");
	Serial.println(ssid);
	Serial.print("IP address: ");
	Serial.println(WiFi.localIP());

	if (MDNS.begin("esp8266")) 
	{
		Serial.println("MDNS responder started");
	}

	server.on("/", handleRoot);
	server.on("/relay_states", handleRelayStates);

	server.on("/relay_1_on", handleRelay1On);
	server.on("/relay_2_on", handleRelay2On);
	server.on("/relay_3_on", handleRelay3On);
	server.on("/relay_4_on", handleRelay4On);

	server.on("/relay_1_off", handleRelay1Off);
	server.on("/relay_2_off", handleRelay2Off);
	server.on("/relay_3_off", handleRelay3Off);
	server.on("/relay_4_off", handleRelay4Off);

	server.onNotFound(handleNotFound);

	server.begin();
	Serial.println("HTTP server started");
}

void loop() 
{
	server.handleClient();
	MDNS.update();
}

void handleRoot() 
{
	server.send(200, "text/plain", "Power Node");
}

void handleRelayStates()
{
	String page = "<HTML><HEAD><TITLE>Relay States</TITLE></HEAD>";

	page += "<BODY><CENTER><B>Relay States</B>";
	page += "<table class=\"relay_states\">";
	page += "<tr><th>Relay 1</th><th>Relay 2</th><th>Relay 3</th><th>Relay 4</th></tr>";
	page += "<tr><td>";
	page += (relay_states & 0x01);
	page += "</td><td>";
	page += (relay_states & 0x01 << 1);
	page += "</td><td>";
	page += (relay_states & 0x01 << 2);
	page += "</td><td>";
	page += (relay_states & 0x01 << 3);
	page += "</td></tr></table>";
	page += "</CENTER></BODY></HTML>";

	server.send(200, "text/html", page);
}

void handleRelay1On(){relayOn(1);}
void handleRelay2On(){relayOn(2);}
void handleRelay3On(){relayOn(3);}
void handleRelay4On(){relayOn(4);}

void handleRelay1Off(){relayOff(1);}
void handleRelay2Off(){relayOff(2);}
void handleRelay3Off(){relayOff(3);}
void handleRelay4Off(){relayOff(4);}

void relayOn(uint8_t relay_num)
{	
	// if(!(relay_states & (0x01 << relay_num)))
	// {
		relay_states &= ~(0x01 << relay_num);
		relay_states = relay_num;
		digitalWrite(RELAY_PIN[relay_num], HIGH);
	// }

	String message = "Relay ";
	message += relay_num;
	message += " on";
	server.send(200, "text/plain", message);
}

void relayOff(uint8_t relay_num)
{	
	if(relay_states & (0x01 << relay_num))
	{
		relay_states |= (0x01 << relay_num);
		digitalWrite(RELAY_PIN[relay_num], LOW);
	}

	String message = "Relay ";
	message += relay_num;
	message += " off";
	server.send(200, "text/plain", message);
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