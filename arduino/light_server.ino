#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#define SIGNAL 5
#define GND 4

const char* ssid = "<insert wifi network name>";
const char* password = "<insert wifi network pass>";

ESP8266WebServer server(80);

const int led = 2;
int STATE = LOW;
int onTime = 0;

void handleRoot() {
  digitalWrite(led, 1);
  server.send(200, "text/plain", "hello from esp8266!");
  digitalWrite(led, 0);
}

void handleNotFound(){
  digitalWrite(led, 1);
  String message = "File Not Found\n\n";
  message += "URI: ";
  message += server.uri();
  message += "\nMethod: ";
  message += (server.method() == HTTP_GET)?"GET":"POST";
  message += "\nArguments: ";
  message += server.args();
  message += "\n";
  for (uint8_t i=0; i<server.args(); i++){
    message += " " + server.argName(i) + ": " + server.arg(i) + "\n";
  }
  server.send(404, "text/plain", message);
  digitalWrite(led, 0);
}

void setup(void){
  pinMode(led, OUTPUT);
  digitalWrite(led, 0);
  Serial.begin(9600);
  IPAddress ip(10,0,100,3);
  IPAddress gateway(10,0,0,1);
  IPAddress subnet(255,255,0,0);
  WiFi.config(ip, gateway, subnet);
  WiFi.begin(ssid, password);
  Serial.println("");
  pinMode(SIGNAL, OUTPUT);  
  pinMode(GND, OUTPUT);
  digitalWrite(GND, LOW);

  // Wait for connection
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to ");
  Serial.println(ssid);
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  if (MDNS.begin("esp8266")) {
    Serial.println("MDNS responder started");
  }

  server.on("/", handleRoot);

  server.on("/inline", [](){
    server.send(200, "text/plain", "this works as well");
  });
  server.on("/on", [](){
    onTime = millis();
    server.send(200, "text/plain", "light on");
  });
    server.on("/off", [](){
    digitalWrite(SIGNAL, LOW);
    server.send(200, "text/plain", "light off");
  });

  server.onNotFound(handleNotFound);

  server.begin();
  Serial.println("HTTP server started");
}

void loop(void){
  server.handleClient();
  if (millis() - onTime < (1000 + 5000 * 2)) {
    digitalWrite(SIGNAL, HIGH);
  } else {
    digitalWrite(SIGNAL, LOW);
  }
}
