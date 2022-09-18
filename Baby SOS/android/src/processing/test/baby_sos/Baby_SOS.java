package processing.test.baby_sos;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import cassette.audiofiles.*; 
import ketai.ui.*; 
import ketai.net.*; 
import ketai.sensors.*; 
import netP5.*; 
import oscP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Baby_SOS extends PApplet {

//connection bout







OscP5 oscP5;
NetAddress myRemoteLocation;
SoundFile m1;
int alarm, d=5;
int c=0xff02F59E;
int coul=0xff130F48, red=0xffFF0000, blue=0xff4DF8FF, green=0xff00FF00, pink=0xffFF4DDF, coula=0;
boolean playing=false;
int nm=2;
String[] musique=new String[4];
String check="";
PImage fond, b, a, ya, blocal, btele, para, help, t1, t2, sup;
public void setup()
{ 
  
  mic = new KetaiAudioInput(this);
  musique[0]="fr.mp3";
  musique[1]="twinkle.mp3";
  musique[2]="classic.mp3";
  musique[3]="282.mp3";
  fond =loadImage("baby.png");
  t1 =loadImage("1phone.png");
  sup =loadImage("gomme.png");
  t2 =loadImage("2phones.png");
  amp=loadImage("amp.png");
  mus=loadImage("mus.png");
  home=loadImage("maison.png");
  b =loadImage("b.png");
  a =loadImage("a.png");
  ya =loadImage("y.png");
  para =loadImage("para.png");
  help =loadImage("help.png");
  blocal =loadImage("local.png");
  btele =loadImage("tele.png");
  font=loadFont("MVBoli-100.vlw");
  strokeWeight(3);
 
  


  orientation(PORTRAIT);
  noStroke();
  background(0xffDCF5C6);
}
public void draw()
{ affichewin=false;
  if (d==3) {
    con();
  } else if (d==0) {
    men();
  } else if (d==2) {
    rem();
  } else if (d==4) {
    aide();
  } else if (d==1) {
    loc();
  } else if (d==5) {
    ent();
  }
   
}
public void mousePressed()
{
  if (d==0) {//****menu buttons****
    if (mouseX>width/10&&mouseX<width/10+height/8&&mouseY>height/12*10&&//local button
      mouseY<height/12*10+height/8)
    {
      d=1;
    } else if (mouseX>width/12*8&&mouseX<width/12*8+height/8&&mouseY>height/12*10&&
      mouseY<height/12*10+height/8)      //remote button
    {
      d=2;
    } else if (mouseX>width/1.14f&&mouseX<width/1.14f+width/10.8f&&mouseY>height/48&&//settings button
      mouseY<height/48+height/19.2f)
    { 
      d=3;
    } else if (mouseX>width/1.38f&&mouseX<width/1.38f+width/10.8f&&mouseY>height/48&&//help button
      mouseY<height/48+height/19.2f)
    {
      d=4;
    }
  } else if (d==3) {//****settings buttons*****

    /*if (mouseX>width/8*5-20&&mouseX<width/8*5+160&&mouseY>height/2-40&&mouseY<height/2+120)
    {
      ip="";
    } else*/ 
    
    if (mouseX>width/20*8+5&&mouseX<width/20*8+5+width/20*3+5&&mouseY>height/2-40&&mouseY<height/2+120)
    { if (KetaiNet.getIP()=="0.0.0.0"&&affichewin==false) {            // ****connection status*****
    //check="NO CONNECTION!!Check it and reset the settings.";
    KetaiAlertDialog.popup(this, "NO CONNECTION!!","Check it and Reset the Settings.");
    affichewin=true;
    }else if(ip.length()<8||ip.length()>15)
    {
     KetaiAlertDialog.popup(this, "Incorrect IP Adress!!","Check it and Reset the Settings.");
    }else{
      d=0;
      KetaiKeyboard.hide(this);}
    } else if (mouseX>width/54&&mouseX<width/3&&mouseY>height/19.2f&&mouseY<height/19.2f+50)
    {
      nm=0;
      nm1=0xffFF0000;
      nm3=0xff9F9DB9;
      nm2=0xff9F9DB9;
    } else if (mouseX>width/3+10&&mouseX<width/3*2+2&&mouseY>height/19.2f&&mouseY<height/19.2f+50)
    {
      nm=1;
      nm2=0xffFF0000;
      nm1=0xff9F9DB9;
      nm3=0xff9F9DB9;
    } else if (mouseX>width/3*2+10&&mouseX<width/3*2+10+width/3-20&&mouseY>height/19.2f&&mouseY<height/19.2f+50)
    {
      nm=2;
      nm3=0xffFF0000;
      nm1=0xff9F9DB9;
      nm2=0xff9F9DB9;
    } else if (mouseX>width/20*8+5&&mouseX<width/20*8+5+width/20*3&&mouseY>height/4.46f&&mouseY<height/4.46f+height/17.45f&&aut!=0)
    {
      aut=0;
      d=1; 
      KetaiKeyboard.hide(this);
    }
  } else if (d==4) {          //*****help buttons*****

    if (mouseX>width/3-100&&mouseX<width/3+200&&mouseY>height/8*6-100
      &&mouseY<height/8*6+200)//return button
    {
      d=5;
    }
  } else if (d==2) { //****remote buttons*****

    if (g==1) {
      g=0;
      sound();
    }

    OscMessage Message = new OscMessage("/bout");
    if (mouseX> width/1.14f&&mouseX< width/1.14f+width/10.8f&&mouseY>height/48&&                   //settings button
      mouseY<height/48+height/19.2f)
    { 
      d=3;
    } else if (mouseX>width/1.38f&&mouseX<width/1.38f+width/10.8f&&mouseY>height/48&&        //help button
      mouseY<height/48+height/19.2f)
    {
      d=4;
    } else if (mouseX>width/27&&mouseX<width/27+width/10.8f&&mouseY>height/48&&        //menu button
      mouseY<height/48+height/19.2f)
    {
      d=5;
    } else if (mouseX>width/4&&mouseX<width/4*3&&mouseY>height/2&&    //ampoule on
      mouseY<height/2+width/2+width/5&&coula==0)
    { 
      Message.add(1);
      coula=green;
      s="ON";
      oscP5.send( Message, myRemoteLocation);
      Message.clear();
    } else if (mouseX>width/4&&mouseX<width/4*3&&mouseY>height/2&&    //ampoule off
      mouseY<height/2+width/2+width/9&&coula!=0)
    {
      Message.add(2);
      coula=0;
      s="OFF";
      oscP5.send( Message, myRemoteLocation);
      Message.clear();
    } else if (mouseX>width/4&&mouseX<width/4*3&&mouseY>100&&          //sound off
      mouseY<100+width/2&&coulm!=0)                            
    {
      Message.add(4);
      coulm=0;
      s1="OFF";
      oscP5.send( Message, myRemoteLocation);
      Message.clear();
    } else if (mouseX>width/4&&mouseX<width/4*3&&mouseY>100&&         //sound on
      mouseY<100+width/2&&coulm==0)
    {
      Message.add(3);
      coulm=255;
      s1="ON"; 
      oscP5.send( Message, myRemoteLocation);
      Message.clear();
    }


    if (coula!=0) {                                                      //ampoule
      if (mouseX>0&&mouseX<width/3&&mouseY>height/4*3&&mouseY<height) {
        coula=pink;
        Message.add(11);

        oscP5.send( Message, myRemoteLocation);
        Message.clear();
      } else if (mouseX>width/3&&mouseX<width/3*2&&mouseY>height-width/4&&mouseY<height) {
        coula=green;
        Message.add(12);

        oscP5.send( Message, myRemoteLocation);
        Message.clear();
      } else if (mouseX>width/3*2&&mouseX<width&&mouseY>height-width/4&&mouseY<height) {
        coula=blue;
        Message.add(13);

        oscP5.send( Message, myRemoteLocation);
        Message.clear();
      }
    }
  } else if (d==1) { //****local buttons*****
    at=0;
    g=0;
    if (mouseX>width/1.14f&&mouseX<width/1.14f+width/10.8f&&mouseY>height/48&&                   //settings button
      mouseY<height/48+height/19.2f)
    {
      d=3;
    } else if (mouseX>width/1.38f&&mouseX<width/1.38f+width/10.8f&&mouseY>height/48&&        //help button
      mouseY<height/48+height/19.2f)
    {
      d=4;
    } else if (mouseX>width/27&&mouseX<width/27+width/10.8f&&mouseY>height/48&&        //menu button
      mouseY<height/48+height/19.2f)
    {
      d=5;
    } else if (mouseX>width/4&&mouseX<width/4*3&&mouseY>height/2-70&&    //ampoule on
      mouseY<height-70&&coul==0xff130F48)
    {
      coul=green;
      s="ON";
    } else if (mouseX>width/4&&mouseX<width/4*3&&mouseY>height/2-70&&    //ampoule off
      mouseY<height-70&&coul!=0xff130F48)
    {
      coul=0xff130F48;
      s="OFF";
    } else if (mouseX>width/4&&mouseX<width/4*3&&mouseY>100&&         //sound 
      mouseY<100+width/2)
    {

      sound();
    }
    if (coul!=0xff130F48) {                                                      //ampoule
      if (mouseX>0&&mouseX<width/3&&mouseY>height/4*3&&mouseY<height) {

        coul=pink;
      } else if (mouseX>width/3&&mouseX<width/3*2&&mouseY>height-width/4&&mouseY<height) {
        coul=green;
      } else if (mouseX>width/3*2&&mouseX<width&&mouseY>height-width/4&&mouseY<height) {
        coul=blue;
      }
    }
  } else if (d==5) {
    if (mouseY>70) {
      d=3;
    }
    if (mouseX>width/1.38f&&mouseX<width/1.38f+width/10.8f&&mouseY>height/48&&//help button
      mouseY<height/48+height/19.2f)
    {image(para, width/1.14f, height/48, width/10.8f, height/19.2f);
  image(help, width/1.38f, height/48, width/10.8f, height/19.2f);
  image(home, width/27, height/48, width/10.8f, height/19.2f);
      d=4;
    }
  }
}


int n=0,ni=0;
int nm1=0xff9F9DB9, nm2=0xff9F9DB9, nm3=0xffFF0000, aut=0xff9F9DB9;
char h;
String ip="|";
public void con() {
  
  stroke(0);
  if ((ip==""||ip.length()==0)&&ni<100) {
    ip="|";
  }else if(ip=="|"&&ni<180){ip="";}else{ni=0;};
  background(0xffDCF5C6);
  tint(255, 30);
  image(fond, width/4, height/3-30, width/2, height/2);
  image(b, width/16, y, width/8, height/5);
  image(a, width/16+80, y, width/8, height/5);
  image(b, width/16+160, y, width/8, height/5);
  image(ya, width/16+220, y, width/8, height/5);

  tint(255);
  textSize(width/5-10);
  fill(0xffFF0000, 30);
  text("S.O.S", width/2-10, y+250);

  textFont(font);
  fill(0xff9F9DB9, random(100));
  rect(width/20*8+5, height/4.68f, width/20*3+5, height/8.72f);
  image(t1, width/20*9, height/4.46f, width/13.5f, height/17.45f);
  fill(0xffFF0000);

  KetaiKeyboard.show(this);
  fill(0xff9F9DB9, random(100));
 // rect(width/8*5, height/2+10, 120, 120);
  rect(width/20*8+5, height/2+10, width/20*3+5, height/8);
 // image(sup, width/8*5+10, height/2+38, 100, 50);
  image(t2, width/20*9-10, height/2+20, width/9, height/16);
  textSize(width/27);
  fill(0);
  text("*RUN AS :", width/16, height/6.85f);
  text(" *The lullaby/music to play:", width/108, height/32);
   fill(0xffFF0000);
  textSize(width/18);
  text("**** 1 phone mode ****", width/6, height/5.33f);

  text("**** 2 phones mode ****", width/6, height/4.68f+height/8.72f+35);  
  textSize(width/30);

  fill(nm1, 100);
  rect(width/54, height/19.2f, width/3-10, 50);
  fill(nm2, 100);
  rect(width/3+10, height/19.2f, width/3-8, 50);
  fill(nm3, 100);
  rect(width/3*2+10, height/19.2f, width/3-20, 50);



  fill(0);

 
  text("Frere Jaque", width/16, height/19.2f+20);
  text("Twinkle Twinkle", width/3+25, height/19.2f+20);
  text("Classic Lullaby", width/3*2+25, height/19.2f+20);
  fill(0xffFF0000);
 
  text(KetaiNet.getIP(), width/12*4, height/4.68f+height/8.72f+130);
  text(ip, width/12*4, height/4.68f+height/8.72f+95);
  fill(0);
  text("(Check this settings before confirming)", width/6,height/4.68f+height/8.72f+55); 

  stroke(0);
  line(width/22, height/6.62f, width/20*6, height/6.62f);
  line(width/28, height/27.42f, width/20*9, height/27.42f);
  // line(0,230,width,230);
  noStroke();

  text("*PLS Enter the IP adress of the other device:", width/9, height/4.68f+height/8.72f+75);

  text("*and copy this IP adress in the other device:",width/9, height/4.68f+height/8.72f+115);
  text("Confirm", width/20*8+15, height/3.2f);
  text("Confirm", width/20*8+15, height/2+10+height/8-30); 
  //text ("DELETE", width/8*5+5+20, height/2+110);
}

public void keyReleased() {
  
  if (ip=="|") {
    ip="";
  }
  
  if (key==ENTER) {
    if (KetaiNet.getIP()=="0.0.0.0"&&affichewin==false) {            // ****connection status*****
    //check="NO CONNECTION!!Check it and reset the settings.";
    KetaiAlertDialog.popup(this, "NO CONNECTION!!","Check it and Reset the Settings.");
    affichewin=true;
    }else if(ip.length()<8||ip.length()>15)
    {
     KetaiAlertDialog.popup(this, "Incorrect IP Adress!!","Check it and Reset the Settings.");
    }else{
      d=0;
      KetaiKeyboard.hide(this);}
    }
  
  else if (( keyCode==67)&&ip.length()!=0){ ip = ip.substring(0, ip.length()-1);}
  else{
    h=key;
    ip=ip+h;
  }
}
public void ent()
{
  aut=0xff9F9DB9;
  if (playing==true) {
    m1.stop();
  }
  nbr=0;
  h=0;

  connected=false;
  background(0xffDCF5C6);
  if (mic.isActive()) {
    mic.stop();
  }


  image(fond, width/4, height/3-30, width/2, height/2);




  image(help, width/1.38f, height/48, width/10.8f, height/19.2f);
  image(b, width/16, y, width/8, height/5);
  image(a, width/16+80, y, width/8, height/5);
  image(b, width/16+160, y, width/8, height/5);
  image(ya, width/16+220, y, width/8, height/5);
  textFont(font);
  fill(0xffFF0000);
  textSize(width/5-10);
  text("S.O.S", width/2-10, y+250);
  textSize(width/10);
  fill(random(255));
  text("Press to Start", width/5, height-60);
}
public void aide() {
  
  background(0xffDCF5C6);
  image(fond, width/4, height/2, width/2, height/2);
  stroke(0);
  fill(0xffE3EFFC,random(100));
  rect(width/3, height/8*6, 160, 80);
  textSize(18);

  fill(0);
  text("this app is created for parents to help them to deal  ", 1, 60);
  text("with their babies.", 1, 80);
  text("It plays baby's musics,turns on soft light automatically", 1, 100);
  text("or manually by connecting", 1, 120);
  text("two devices via WIFI (don't worry it's very easy):", 1, 140);
  text("1)Just make sur you are both connected to the same wifi network", 1, 160);
  text("and each device has already installed this app", 1, 180);
  text("2)then copy each device's IP adress(provided in settings)", 1, 200);
  text("on the other device(in the settings)", 1, 220);
  text("The remote device is alarmed if the baby cries.", 1, 240);
  text("**DON'T FORGET TO PUT THE LOCAL DEVICE IN A SILENT**", 1, 300);
  text("**ROOM SO THAT IT CAN PERFECTLY HEAR THE BABY**", 1, 330);
  text("**THE LOCAL DEVICE MUST BE CLOSE TO THE BABY**", 1, 360);
  text("**(THE PERFECT DISTANCE IS <3 M>)**", 1, 390);
  text("**YOU CAN OPEN AN ACCESS POINT ON ONE DEVICE**", 1, 420);
  text("** AND CONNECT THE OTHER ONE TO IT**", 1, 450);
  fill(0xffFF0000);
  text("MENU", width/3+50, height/8*6+50);
}
KetaiAudioInput mic;
short[] data;
int coule, at=0;
int g=0, autn=2;
boolean connected=false,affichewin=false;
int sensor=2500;
public void loc()

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
  if (coule==0xffF6FF00)
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
  image(para, width/1.14f, height/48, width/10.8f, height/19.2f);
  image(help, width/1.38f, height/48, width/10.8f, height/19.2f);
  image(home, width/27, height/48, width/10.8f, height/19.2f);
  fill(red);
  textSize(width/13.5f);
  text("Light: "+s, width/20*6, height/2-50);
  text("Music: "+s1, width/20*6, 50);

  fill(0xff130F48);
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



public void record()
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
          coule=0xffF6FF00;
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
public void onAudioEvent(short[] _data)
{
  data= _data;
  record();
}

int y=height/4;
PFont font;
public void men() {
  stroke(0);
  aut=0xff9F9DB9;
  if (playing==true) {
    m1.stop();
  }
  nbr=0;
  h=0;
  autn=0;
  connected=false;
  background(0xffDCF5C6);

  if (mic.isActive()) {
    mic.stop();
  }
 
  fill(0xff9F9DB9, random(100));
  rect(width/10-10, height/12*10-10, height/8+20, height/8+20);
  rect(width/12*8-10, height/12*10-10, height/8+20, height/8+20);
  tint(255);

  image(fond, width/4, height/3-30, width/2, height/2);

 image(para, width/1.14f, height/48, width/10.8f, height/19.2f);
  image(help, width/1.38f, height/48, width/10.8f, height/19.2f);

  image(b, width/16, y, width/8, height/5);
  image(a, width/16+80, y, width/8, height/5);
  image(b, width/16+160, y, width/8, height/5);
  image(ya, width/16+220, y, width/8, height/5);
  image(blocal, width/10, height/12*10, height/8, height/8);
  image(btele, width/12*8, height/12*10, height/8, height/8);
  textFont(font);
 /* fill(0);
  textSize(width/23);
  text(check, 0, height/3*2-40);*/

  fill(0xffFF0000);
  textSize(width/5-10);
  text("S.O.S", width/2-10, y+250);
  textSize(width/21);

  text("Beside the Baby", 30, height-10);
  text("Beside the Mom", width/2+60, height-10);
}    

public void sound()
{ 
    if(playing){
   coulm=0;
   s1="OFF";
   playing=false;
   m1.stop();
 
  }
  else{    
    coulm=255;
    s1="ON";   
    m1=new SoundFile(this,musique[nm]);
    m1.loop();
    playing=true;
    
  }
  
  
}
PImage amp, mus, home;
String s="OFF", s1="OFF";
int elx=width/2, ely=height/5*4;
int coulm=0, couler=0xffDCF5C6;
int nbr=0;
public void rem() {
  affichewin=true;
  background(couler);
  if (!connected) {

    oscP5 = new OscP5(this, 6549);
    myRemoteLocation = new NetAddress(ip, 5498);
    connected=true;
  }

  if (g==1) { 
    nbr=1;
    background(0xffFF0000);
    image(fond, width/4, height/3-30, width/2, height/2);
  } else {
    tint(coula);
    image(amp, width/16*5, height/2, width/16*6, width/2+width/9);
    tint(coulm);
    image(mus, width/4, 100, width/2, width/2);

    tint(255);
 image(para, width/1.14f, height/48, width/10.8f, height/19.2f);
  image(help, width/1.38f, height/48, width/10.8f, height/19.2f);
  image(home, width/27, height/48, width/10.8f, height/19.2f);
    fill(red);
    textSize(40);
    text("Light: "+s, width/20*6, height/2-50);
    text("Music :"+s1, width/20*6, 50);

    fill(pink);
    rect(0, height-width/8, width/3, width/8);
    fill(green);
    rect(width/3, height-width/8, width/3, width/8);
    fill(blue);
    rect(width/3*2, height-width/8, width/3, width/8);
    noStroke();
    ;



    couler=0xffDCF5C6;
  }
}
public void oscEvent(OscMessage theOscMessage) {
  if (d==2) {//***************************remote receiver
    /* print the address pattern and the typetag of the received OscMessage */
    print("### received an osc message.");
    print(" addrpattern: "+theOscMessage.addrPattern());
    println(" typetag: "+theOscMessage.typetag());
    //background(random(255));  

    if (theOscMessage.checkAddrPattern("/al")==true&&g==0&&nbr==0) {


      nm=3;
      playing=false;
      sound();
      playing=true;

      g=1;
      theOscMessage.clear();
    }
  } else if (d==1) //   ***********************local receiver
  { /* print the address pattern and the typetag of the received OscMessage */
    print("### received an osc message.");
    print(" addrpattern: "+theOscMessage.addrPattern());
    println(" typetag: "+theOscMessage.typetag());

    if (theOscMessage.checkAddrPattern("/bout")==true) {
      int first=theOscMessage.get(0).intValue();

      if (first==1) {
        coul=green;
        s="ON";
      } else if (first==2) {   
        coul=0xff130F48;
        s="OFF";
      } else if (first==3) {
        sound();
      } else if (first==4) {
        sound();
      } else if (first==11) {
        coul=pink;
      } else if (first==12) {
        coul=green;
      } else if (first==13) {
        coul=blue;
      }



      theOscMessage.clear();
    }
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Baby_SOS" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
