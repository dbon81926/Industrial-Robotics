#define eStopButton 2  
#define resetButton 4
#define eStopStatus 8 

int eStopButtonState = 0;      // hold states in value
int resetButtonState = 0;      
bool eStopActive = false;     

void setup() {
  Serial.begin(9600);
  pinMode(eStopButton, INPUT);
  pinMode(resetButton, INPUT);
  pinMode(eStopStatus, OUTPUT);
}
void loop() {
  eStopButtonState = digitalRead(eStopButton);
  resetButtonState = digitalRead(resetButton);

  // eStop pressed ONCE
  if (eStopButtonState == HIGH && !eStopActive) {
    digitalWrite(eStopStatus, HIGH); 
    eStopActive = true;
    Serial.println("ESTOP ON");
  }

  // check for both buttons, turn off LED
  if (eStopButtonState == HIGH && resetButtonState == HIGH) {
    digitalWrite(eStopStatus, LOW); 
    eStopActive = false;
    Serial.println("ESTOP OFF");
    delay(100); //debounce
  }
}
