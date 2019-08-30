#include <Servo.h>
#include "pitches.h"

#include <LiquidCrystal_I2C.h>
#include <Wire.h>
#include "RTClib.h"
//------------------------------------------


RTC_Millis rtc; 
LiquidCrystal_I2C lcd(0x27,16,2);  // set the LCD address to 0x20 for a 16 chars and 2 line display 

//------------------------------------------------------------
#define analogPin 0    // 워터센서 analog port 0 연결 선언
#define PIEZO 10         // 피에조부저 10번 포트 연결 선언
int val = 0;         // 전류변화값 변수선언
//--------------------------------------------------------------
int song[ ] = {    NOTE_G4, NOTE_E5, NOTE_D5, NOTE_C5, NOTE_G4, 0,        
             NOTE_G4, NOTE_E5, NOTE_D5, NOTE_C5, NOTE_A4, 0,        
             NOTE_A4, NOTE_F5, NOTE_E5, NOTE_D5, NOTE_B4, 0,         
    NOTE_G5, NOTE_G5, NOTE_F5, NOTE_D5, NOTE_E5, NOTE_C5, 0   };  
// 징글벨 첫 소절 연주시간                   
int time[ ] = {     250, 250, 250, 250, 750, 250,  
                      250, 250, 250, 250, 750, 250,
                      250, 250, 250, 250, 750, 250,
                      250, 250, 250, 250, 500, 250, 250  };                      
//------------------------------------------------------------------------


#define analogPin1 1    // 워터센서 analog port 0 연결 선언
#define PIEZ1 9         // 피에조부저 10번 포트 연결 선언
int val1 = 0;         // 전류변화값 변수선언

//-------------------------------------------------------------------------

const int gasPin = A2 ;  // 가스누츨입력센서
int motor_control = 8;
Servo servo;               

//--------------------------------------------------------------------------

void setup () { 
  
    Serial.begin(9600); 
    // following line sets the RTC to the date & time this sketch was compiled 
    rtc.begin(DateTime(__DATE__, __TIME__)); 
    lcd.init();  
    Wire.begin();
    lcd.backlight();  // turn on backlight
    lcd.print("hello!"); 
    servo.attach(motor_control); // 서보모터
} 

void loop () { 
  //-------- 내부워터센서 --------------------------------
  val = analogRead(analogPin);   // analogPin 의 변화값(전류값)을 읽음
  int i;
  pinMode(PIEZO, OUTPUT);
if (val > 500)                 // val 값이 100이 넘으면 (전류가 100이 넘으면)
  {      
     for (i=0; i<25; i++){
    tone(PIEZO, song[i], time[i]);    // 배열순으로 노래 재생
    delay(time[i]); } 
  }
//-----------외부워터센서---------------------------------------------

  val1 = analogRead(analogPin1);   // analogPin 의 변화값(전류값)을 읽음
  int x;

  if (val1 > 700)                 // val 값이 100이 넘으면 (전류가 100이 넘으면)
  {      
     for (x=0; x<8; x++){
    tone(PIEZ1,823);
    delay(200);
    noTone(PIEZ1);
    delay(300);
    }
  }
 //---------------가스누출---------------------------------------------------------
   int gas;
  gas=analogRead(A2);
     servo.write(0);
     
  if(gas> 500){
     servo.write(90);}

 //----------------------------------------------------------------------------------

    DateTime now = rtc.now(); 
     
    
     
    // calculate a date which is 7 days and 30 seconds into the future 
    DateTime future (now.unixtime() + 0 * 86400L +30); 
     
     
    lcd.clear(); 
    lcd.print("Today is "); 
    lcd.print(future.month(), DEC); 
    lcd.print('.'); 
    lcd.print(future.day(), DEC); 
    lcd.setCursor(0,1); 
    lcd.print(future.hour(), DEC); 
    lcd.print(':'); 
    lcd.print(future.minute(), DEC); 
    lcd.print(':'); 
    lcd.print(future.second(), DEC); 
    delay(1000); 
}


