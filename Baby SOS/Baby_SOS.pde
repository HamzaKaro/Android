//connection bout
import cassette.audiofiles.*;
import ketai.ui.*;
import ketai.net.*;
import ketai.sensors.*;
import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
SoundFile m1;
int alarm, d=5;
color c=#02F59E;
color coul=#130F48, red=#FF0000, blue=#4DF8FF, green=#00FF00, pink=#FF4DDF, coula=0;
boolean playing=false;
int nm=2;
String[] musique=new String[4];
String check="";
PImage fond, b, a, ya, blocal, btele, para, help, t1, t2, sup;
void setup()
{ 
  fullScreen();
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
  background(#DCF5C6);
}
void draw()
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
void mousePressed()
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
    } else if (mouseX>width/1.14&&mouseX<width/1.14+width/10.8&&mouseY>height/48&&//settings button
      mouseY<height/48+height/19.2)
    { 
      d=3;
    } else if (mouseX>width/1.38&&mouseX<width/1.38+width/10.8&&mouseY>height/48&&//help button
      mouseY<height/48+height/19.2)
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
    } else if (mouseX>width/54&&mouseX<width/3&&mouseY>height/19.2&&mouseY<height/19.2+height/19.2)
    {
      nm=0;
      nm1=#FF0000;
      nm3=#9F9DB9;
      nm2=#9F9DB9;
    } else if (mouseX>width/3+10&&mouseX<width/3*2+2&&mouseY>height/19.2&&mouseY<height/19.2+height/19.2)
    {
      nm=1;
      nm2=#FF0000;
      nm1=#9F9DB9;
      nm3=#9F9DB9;
    } else if (mouseX>width/3*2+10&&mouseX<width/3*2+10+width/3-20&&mouseY>height/19.2&&mouseY<height/19.2+height/19.2)
    {
      nm=2;
      nm3=#FF0000;
      nm1=#9F9DB9;
      nm2=#9F9DB9;
    } else if (mouseX>width/20*8+5&&mouseX<width/20*8+5+width/20*3&&mouseY>height/4.46&&mouseY<height/4.46+height/17.45&&aut!=0)
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
    if (mouseX> width/1.14&&mouseX< width/1.14+width/10.8&&mouseY>height/48&&                   //settings button
      mouseY<height/48+height/19.2)
    { 
      d=3;
    } else if (mouseX>width/1.38&&mouseX<width/1.38+width/10.8&&mouseY>height/48&&        //help button
      mouseY<height/48+height/19.2)
    {
      d=4;
    } else if (mouseX>width/27&&mouseX<width/27+width/10.8&&mouseY>height/48&&        //menu button
      mouseY<height/48+height/19.2)
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
    if (mouseX>width/1.14&&mouseX<width/1.14+width/10.8&&mouseY>height/48&&                   //settings button
      mouseY<height/48+height/19.2)
    {
      d=3;
    } else if (mouseX>width/1.38&&mouseX<width/1.38+width/10.8&&mouseY>height/48&&        //help button
      mouseY<height/48+height/19.2)
    {
      d=4;
    } else if (mouseX>width/27&&mouseX<width/27+width/10.8&&mouseY>height/48&&        //menu button
      mouseY<height/48+height/19.2)
    {
      d=5;
    } else if (mouseX>width/4&&mouseX<width/4*3&&mouseY>height/2-70&&    //ampoule on
      mouseY<height-70&&coul==#130F48)
    {
      coul=green;
      s="ON";
    } else if (mouseX>width/4&&mouseX<width/4*3&&mouseY>height/2-70&&    //ampoule off
      mouseY<height-70&&coul!=#130F48)
    {
      coul=#130F48;
      s="OFF";
    } else if (mouseX>width/4&&mouseX<width/4*3&&mouseY>100&&         //sound 
      mouseY<100+width/2)
    {

      sound();
    }
    if (coul!=#130F48) {                                                      //ampoule
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
    if (mouseX>width/1.38&&mouseX<width/1.38+width/10.8&&mouseY>height/48&&//help button
      mouseY<height/48+height/19.2)
    {image(para, width/1.14, height/48, width/10.8, height/19.2);
  image(help, width/1.38, height/48, width/10.8, height/19.2);
  image(home, width/27, height/48, width/10.8, height/19.2);
      d=4;
    }
  }
}