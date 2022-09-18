int c1=A0,c2=A2,c3=A3,c4=A4,c5=A5;
int vit1=5,vit2=6;
int g1=3,d1=8,g2=4,d2=9;
float a,b,d,e,somme;



void setup() {
pinMode(c1,INPUT);
pinMode(c2,INPUT);
pinMode(c3,INPUT);
pinMode(c4,INPUT);
pinMode(c5,INPUT);
pinMode(vit1,OUTPUT);
pinMode(vit2,OUTPUT);
pinMode(g2,OUTPUT);
pinMode(d1,OUTPUT);
pinMode(d2,OUTPUT);
pinMode(g1,OUTPUT);

}

void loop() {
 int c=analogRead(c3);

 if(c>800){
  analogWrite(vit2,170);
   analogWrite(vit1,170);
  digitalWrite(d1,HIGH);
  digitalWrite(g1,HIGH);
  digitalWrite(d2,LOW);
  digitalWrite(g2,LOW);

  
 }
 else{
a=analogRead(c1);
   b=analogRead(c2); 
   d=analogRead(c4);
   e=analogRead(c5); 
   somme=a+b-d-e;
  if(somme>0)
  {
    gauche();
  }
  else
  {
    droite();  
  }
  };
  }
 void droite()
{ if(a>=b){analogWrite(vit1,200);
  analogWrite(vit2,200);
  
           digitalWrite(g1,HIGH);
           digitalWrite(d2,HIGH);
           digitalWrite(g2,LOW);
           digitalWrite(d1,LOW);}else{   
           
           analogWrite(vit1,180);
           digitalWrite(g1,HIGH);
           digitalWrite(d2,LOW);
           digitalWrite(g2,LOW);
           digitalWrite(d1,LOW);
           };
}
void gauche()
{ if(d>=e){analogWrite(vit1,200);
           analogWrite(vit2,200);
           digitalWrite(d1,HIGH);
           digitalWrite(g2,HIGH);
           digitalWrite(d2,LOW);
           digitalWrite(g1,LOW);
           }else{   
               analogWrite(vit2,180);
           
           digitalWrite(d1,HIGH);
           digitalWrite(d2,LOW);
           digitalWrite(g2,LOW);
           digitalWrite(g1,LOW);
           };
}
 


