
 int esp;
int n=0,ni=0;
int nm1=#9F9DB9, nm2=#9F9DB9, nm3=#FF0000, aut=#9F9DB9;
char h;
String ip="|";
void con() {
  esp=height/48;
  stroke(0);
  if ((ip==""||ip.length()==0)&&ni<100) {
    ip="|";
  }else if(ip=="|"&&ni<180){ip="";}else{ni=0;};
  background(#DCF5C6);
  tint(255, 30);
  image(fond, width/4, height/3-30, width/2, height/2);
  image(b, width/16, y, width/8, height/5);
  image(a, width/16+80, y, width/8, height/5);
  image(b, width/16+160, y, width/8, height/5);
  image(ya, width/16+220, y, width/8, height/5);

  tint(255);
  textSize(width/5-10);
  fill(#FF0000, 30);
  text("S.O.S", width/2-10, y+250);

  textFont(font);
  fill(#9F9DB9, random(100));
  rect(width/20*8+5, height/4.68, width/20*3+5, height/8.72);
  image(t1, width/20*9, height/4.46, width/13.5, height/17.45);
  fill(#FF0000);

  KetaiKeyboard.show(this);
  fill(#9F9DB9, random(100));
 // rect(width/8*5, height/2+10, 120, 120);
  rect(width/20*8+5, height/2+10, width/20*3+5, height/8);
 // image(sup, width/8*5+10, height/2+38, 100, 50);
  image(t2, width/20*9-10, height/2+20, width/9, height/16);
  textSize(width/27);
  fill(0);
  text("*RUN AS :", width/16, height/6.85);
  text(" *The lullaby/music to play:", width/108, height/32);
   fill(#FF0000);
  textSize(width/18);
  text("**** 1 phone mode ****", width/6, height/5.33);

  text("**** 2 phones mode ****", width/6, height/4.68+height/8.72+height/27.42);  
  textSize(width/30);

  fill(nm1, 100);
  rect(width/54, height/19.2, width/3-10, height/19.2);
  fill(nm2, 100);
  rect(width/3+10, height/19.2, width/3-8, height/19.2);
  fill(nm3, 100);
  rect(width/3*2+10, height/19.2, width/3-20, height/19.2);



  fill(0);

 
  text("Frere Jaque", width/16, height/19.2+height/19.2/2);
  text("Twinkle Twinkle", width/3+25, height/19.2+height/19.2/2);
  text("Classic Lullaby", width/3*2+25, height/19.2+height/19.2/2);
  fill(#FF0000);
 
  text(KetaiNet.getIP(), width/12*4, height/4.68+height/8.72+height/27.42+5*esp);
  text(ip, width/12*4, height/4.68+height/8.72+height/27.42+3*esp);
  fill(0);
  text("(Check this settings before confirming)", width/6,height/4.68+height/8.72+height/27.42+esp); 

  stroke(0);
  line(width/22, height/6.62, width/20*6, height/6.62);
  line(width/28, height/27.42, width/20*9, height/27.42);
  // line(0,230,width,230);
  noStroke();

  text("*PLS Enter the IP adress of the other device:", width/9,height/4.68+height/8.72+height/27.42+2*esp);

  text("*and copy this IP adress in the other device:",width/9, height/4.68+height/8.72+height/27.42+4*esp);
  text("Confirm", width/20*8+15, height/3.2);
  text("Confirm", width/20*8+15, height/2+10+height/8-30); 
  //text ("DELETE", width/8*5+5+20, height/2+110);
}

void keyReleased() {
  
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