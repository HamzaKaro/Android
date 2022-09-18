PImage amp, mus, home;
String s="OFF", s1="OFF";
int elx=width/2, ely=height/5*4;
color coulm=0, couler=#DCF5C6;
int nbr=0;
void rem() {
  affichewin=true;
  background(couler);
  if (!connected) {

    oscP5 = new OscP5(this, 6549);
    myRemoteLocation = new NetAddress(ip, 5498);
    connected=true;
  }

  if (g==1) { 
    nbr=1;
    background(#FF0000);
    image(fond, width/4, height/3-30, width/2, height/2);
  } else {
    tint(coula);
    image(amp, width/16*5, height/2, width/16*6, width/2+width/9);
    tint(coulm);
    image(mus, width/4, 100, width/2, width/2);

    tint(255);
 image(para, width/1.14, height/48, width/10.8, height/19.2);
  image(help, width/1.38, height/48, width/10.8, height/19.2);
  image(home, width/27, height/48, width/10.8, height/19.2);
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



    couler=#DCF5C6;
  }
}
void oscEvent(OscMessage theOscMessage) {
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
        coul=#130F48;
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