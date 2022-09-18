import ketai.sensors.*;


int image;
boolean arriere,avant,bas;
KetaiSensor sensor;
void setup()
{ sensor = new KetaiSensor(this);
  sensor.start();
  orientation(LANDSCAPE);
  image =#000000;
  fullScreen();
  background(image);
  y=height/20*16;
  x=width;
  x1=-width/4;
  y1=height-45;
   arriere=true;avant=true;bas=false;
   saut=y1;
   nbr=1;
   nouv=0;
   xxe=50;
   xxe1=50;
   dif=8;
   scene=1;
   textSize(100);
   
}
void draw()
{ if(scene==1){
  background(image);
  fill(#ffffff);
  decore();
  person();
  limite();
  ennemi();
  
  text("score:"+score,50,100);}

    else
  {
    over();
  }
}
void mousePressed()
{
  if(scene==2)
  {
   y=height/20*16;
   x=width;
   x1=-width/4;
   y1=height-45;
   arriere=true;
   avant=true;
   bas=false;
   saut=y1;
   nbr=1;
   nouv=0;
   xxe=50;
   xxe1=50;
   scene=1;
   dif=8;
   score=0;
  }
}