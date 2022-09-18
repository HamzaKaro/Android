import processing.net.*;
import processing.serial.*;
Serial s;

Client v;
PImage bg;
int a;

void setup()
{
  size(225, 225);
  bg=loadImage("et.jpg");
  s=new Serial(this,"COM3",9600);
  v =new Client(this, "154.105.177.15", 6788);
  
}
void draw()
{ 
  background(bg);
  a=v.read();
  if(a!=0&&a!=1){
  text (a, 180, 200);
  textSize(30);
  fill(800, 0, 0);


  if (a==200)
  {
   s.write('1');
    bg=loadImage("al.jpg");
  }
   else if (a==33)
  {
   s.write('2');
    bg=loadImage("al.jpg");
  }
  else if (a==34)
  {
   s.write('3');
    bg=loadImage("al.jpg");
  }
  else if (a==35)
  {
   s.write('4');
    bg=loadImage("al.jpg");
  }
  else
  {
     bg=loadImage("et.jpg");
     s.write('0');
  }
 
}}