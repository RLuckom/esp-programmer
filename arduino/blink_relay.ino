#define SIGNAL 12
#define GND 4

void setup() {
  pinMode(SIGNAL, OUTPUT);  
  pinMode(GND, OUTPUT);  // Initialize the LED_BUILTIN pin as an output
  digitalWrite(GND, LOW);
}

// the loop function runs over and over again forever
void loop() {
  digitalWrite(SIGNAL, LOW);   // Turn the LED on (Note that LOW is the voltage level
                                    // but actually the LED is on; this is because 
                                    // it is acive low on the ESP-01)
  delay(1000);                      // Wait for a second
  digitalWrite(SIGNAL, HIGH);  // Turn the LED off by making the voltage HIGH
  delay(2000);                      // Wait for two seconds (to demonstrate the active low LED)
}
