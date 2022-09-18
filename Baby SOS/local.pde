KetaiAudioInput mic;
short[] data;
color coule, at=0;
int g=0, autn=2;
boolean connected=false,affichewin=false;
int sensor=2500;
void loc()

{ 
  if (!connected) {

    oscP5 = new OscP5(this, 5498);
    myRemoteLocation = new NetAddress(ip, 6549);
    connected=true;
  }
  background(coule);

  tint(coul);
  image(amp, width/4, height/2-50, width/2, height/2-50);
  tint(0);
  if (coule==#F6FF00)
  {
    g=1;
  };
  if (g==1) {
    at=255;
  }


  record();


  /* tint(coul);
   image(amp,width/16*5,height/2,width/16*6,width/2+width/9);*/
  tint(coulm);
  image(mus, width/4, 100, width/2, width/2);

  tint(255);
  image(para, width/1.14, height/48, width/10.8, height/19.2);
  image(help, width/1.38, height/48, width/10.8, height/19.2);
  image(home, width/27, height/48, width/10.8, height/19.2);
  fill(red);
  textSize(width/13.5);
  text("Light: "+s, width/20*6, height/2-50);
  text("Music: "+s1, width/20*6, 50);

  fill(#130F48);
  rect(0, height-width/8-5, width, width/8);
  stroke(50);
  fill(pink);
  rect(0, height-width/8, width/3, width/8);
  fill(green);
  rect(width/3, height-width/8, width/3, width/8);
  fill(blue);
  rect(width/3*2, height-width/8, width/3, width/8);


  noStroke();
  if (aut==0&&autn==0) {
    if (playing==false) {
      sound();
    }
    s1="ON";
    s="ON"; 
    coul=green;
    autn=2;
  }
}



void record()
{ 
  if (!mic.isActive()) {
    mic.start();
  } 
  OscMessage myMessage = new OscMessage("/al");
  if (data != null)
  {  
    for (int i = 0; i < data.length; i++)
    {
      if (i != data.length-1)

        //line(i, map(data[i], -32768, 32767,height,0), i+1, map(data[i+1], -32768, 32767,height,0));
        if (data[i]>sensor) {
          coule=#F6FF00;
          oscP5.send( myMessage, myRemoteLocation);
          myMessage.clear();
          autn=0;      //****automatic mode***
        } else {
          coule=coul;
          autn=2;
        }
    }
  }
}
void onAudioEvent(short[] _data)
{
  data= _data;
  record();
}