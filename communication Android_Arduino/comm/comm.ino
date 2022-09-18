int l=11;
int l1=5;
int l2=4;
int l3=7;
char a;
void setup() {
pinMode(l,OUTPUT);
pinMode(l1,OUTPUT);
pinMode(l2,OUTPUT);
pinMode(l3,OUTPUT);
Serial.begin(9600);
}

void loop() {
if(Serial.available())
{a=Serial.read();
switch(a)
{case '1':digitalWrite(l,HIGH);break;
 case '2':digitalWrite(l1,HIGH);break;
 case '3':digitalWrite(l2,HIGH);break;
 case '4':digitalWrite(l3,HIGH);break;
 default: digitalWrite(l,LOW);
          digitalWrite(l1,LOW);
          digitalWrite(l2,LOW);
          digitalWrite(l3,LOW);
}
}
}
