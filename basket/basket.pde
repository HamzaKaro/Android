int xtir,ytir,score=0;
int xpan=-1,ypan,level=500;
int xpar,ypar,c;            
int xin,yin,Screen=1;
float alp;
boolean pann=false;  
PImage angry,viseur,fond;
                            //probleme debut du lancemant
void setup()
{ c=xtir-1000;
  fullScreen();
  textSize(40);
  alp=0;
  angry=loadImage("angry.png");
  viseur=loadImage("viseur.png");
  fond=loadImage("fond.jpg");
  orientation(LANDSCAPE);
  frameRate(5000);
  
}
void draw()
{ 
  image(fond,0,0,width,height);
  fill(#ff0000);
  text("score : "+score,50,50);
translate(width/2,height/2);
pann();
if(Screen==1)
{if(xpan==-1){
 xpan=int(random(0,width/2-100));
 ypan=int(random(-height/4,height/2-100));};
  tir();
}
else if (Screen==2)
{
  ball();
}
}
void mouseReleased()
{
  Screen=2;
}