
import ketai.sensors.*;

KetaiSensor sensor;
int x,x1,y=-200,dif=5,dx=width/2,screen=0,start,score=0;
float rotationX, rotationY, rotationZ;
void setup()
{ fullScreen();
orientation(LANDSCAPE);
  x=int(random(6))*90;
  textSize(75);
  start=millis();
  sensor = new KetaiSensor(this);
  sensor.start();
  noStroke();
  
}
void draw()
{if(screen==0){
  
  background(#9D9B92);
  decore();
  driver();
  text("temps:"+((millis()/1000)-start/1000),50,100);
  text("score:"+score,50,200);
}
else
{
  background(#DE2828);
  text("game over",width/3,height/2);
  text("Score:"+score,width/3,height/4);
}
  
}
void mousePressed()
{
  if (screen==1)
  {
    screen=0;
    y=-200;
    dif=5;
    score=0;
    start=millis();
  }
}