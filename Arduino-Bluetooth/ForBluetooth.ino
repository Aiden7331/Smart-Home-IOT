#include <Servo.h>

#include <SoftwareSerial.h>

#include <dht11.h>
#include "pitches.h"

#define UltraSonics_Trig 3   // 초음파센서 
#define UltraSonics_echo 4   // 초음파센서 입력
#define UltraSonics_led 11    // 초음파센서 led 핀
//-------------온도조절기----------------------------------------------------------------------
#define LivingRoom 10
#define BedRoom 5
#define window 2

//-------------온습도기능----------------------------------------------------------------------
dht11 DH11;    // DHT11 클래스에 10번 디지털 데이터 핀 생성.
//----------------블루투스 연결 부분-----------------------------------------------------------------
Servo servo;
SoftwareSerial bluetooth(8,9); //2번 핀과 3번핀을 각각 TX, RX에 연결함.
String buffer;
int Lset=10;
int Bset=10;

bool ParkingLot();
void aircondition(int pin, int power,int onoff);
// 주차장 시스템. 초음파 반사되어 돌아오는 거리를 반환하는 함수
long microsecondesToInches(long microseconds){
  return microseconds /74 /2;
}
// 주차장시스템. 초음파 반사되어 돌아오는 시간 반환하는 함수
long microsecondesToCensong_timeters(long microseconds){
  return microseconds /29 /2;
}
char* IntToChar(int target);

void setup() {
  // put your setup code here, to run once:
  bluetooth.begin(9600); //baud rate 9600
  Serial.begin(115200);
//  pinMode(9,INPUT);
//  pinMode(10,INPUT); 
  pinMode(LivingRoom,OUTPUT);
  pinMode(5,OUTPUT); //LED핀
  pinMode(UltraSonics_Trig, OUTPUT); // 주차장
  pinMode(UltraSonics_echo, INPUT); // 주차장
  
  servo.attach(2); // 서보모터
  Serial.write("complete initialize");
}

int pos=0;

void loop() {
  int err,Ltemp,Lhumi=0,Btemp,Bhumi=0;
  buffer="";
  servo.write(pos);
  servo.detach();
  
  while(bluetooth.available()){ // 블루투스에서 들어온 정보가 있다면?
    char data=(char)bluetooth.read();
   
    Serial.print(data);
    bluetooth.flush();
    if(data=='A'){
       analogWrite(10,255);
       bluetooth.flush();
       buffer="";
    }
    if(data=='B'){
       analogWrite(10,0);
       bluetooth.flush();
       buffer="";
     }
    if(data=='C'){
      analogWrite(5,255);
      bluetooth.flush();
      buffer="";
     }
    if(data=='D'){
     analogWrite(5,0);
     bluetooth.flush();
     buffer="";
    }
    if(data=='E'){
     servo.attach(2);
     for(; pos<90; pos++){
     servo.write(pos);
     delay(10);
     }
     bluetooth.flush();
     buffer="";
    }
    if(data=='F'){
     servo.attach(2);
     for(; pos>=0; pos--){
     servo.write(pos);
     delay(10);
     }
     for(; pos>=0; pos--){
     servo.write(pos);
     delay(10);
     }
    }
     bluetooth.flush();
     buffer="";
  }
  
  Serial.println("temperature start");
  if((err=DH11.read(13))==0){//거실 온습도 읽기 
     Ltemp=DH11.temperature;
     Serial.print("LivingTemp");
     Serial.println(Ltemp);
    bluetooth.print("T"+String(Ltemp)+"|");
     Lhumi=DH11.humidity;
     Serial.print("LivingHumi");
     Serial.println(Lhumi);
    bluetooth.print("H"+String(Lhumi)+"|");
  }
  else     { //에러 출력                            
    Serial.print("LivingRoom Error No :");Serial.print(err);
  }
  if((err=DH11.read(12))==0){//침실 온습도 읽기   
     Btemp=DH11.temperature;
     Serial.print("BedTemp");
     Serial.println(Btemp);
    bluetooth.print("t"+String(Btemp)+"|");
     Bhumi=DH11.humidity;
     Serial.print("BedHumi");
     Serial.println(Bhumi);
    bluetooth.print("h"+String(Bhumi)+"|");
  }
  else     { //에러 출력      
    Serial.print("BedRoomError No :");Serial.print(err);
  }
  Serial.println("Cycle pass");
  
  
  bluetooth.flush();

  ParkingLot();
  
}

void aircondition(int pin, int power,int onoff){ // the power must be under 3
  if(onoff==1)
    analogWrite(pin,155+power*50); // it can be 0,1 or 2
  else
    digitalWrite(pin,LOW);
}


bool ParkingLot(){  // 주차장 시스템. 사용자 입력 받지 않음.
  bool Park=false;
  long duration, inches, cm;
  
  digitalWrite(UltraSonics_Trig,LOW);
  delayMicroseconds(2);

  digitalWrite(UltraSonics_Trig,HIGH);
  delayMicroseconds(10);

  digitalWrite(UltraSonics_Trig,LOW);

  duration=pulseIn(UltraSonics_echo, HIGH);

  inches=microsecondesToInches(duration);
  cm=microsecondesToCensong_timeters(duration);
Serial.print("cm");
Serial.println(cm);
  if(cm < 5){
    digitalWrite(UltraSonics_led, HIGH);
    bluetooth.print("P");
    
    Park=true; // 주차장에 차가 들어와있는 상태.
  }else{
    bluetooth.print("U");
    digitalWrite(UltraSonics_led, LOW);
  }
  return Park;

}


