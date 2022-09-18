
int y=height/4;
PFont font;
void men() {
  stroke(0);
  aut=#9F9DB9;
  if (playing==true) {
    m1.stop();
  }
  nbr=0;
  h=0;
  autn=0;
  connected=false;
  background(#DCF5C6);

  if (mic.isActive()) {
    mic.stop();
  }
 
  fill(#9F9DB9, random(100));
  rect(width/10-10, height/12*10-10, height/8+20, height/8+20);
  rect(width/12*8-10, height/12*10-10, height/8+20, height/8+20);
  tint(255);

  image(fond, width/4, height/3-30, width/2, height/2);

 image(para, width/1.14, height/48, width/10.8, height/19.2);
  image(help, width/1.38, height/48, width/10.8, height/19.2);

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

  fill(#FF0000);
  textSize(width/5-10);
  text("S.O.S", width/2-10, y+250);
  textSize(width/21);

  text("Beside the Baby", 30, height-10);
  text("Beside the Mom", width/2+60, height-10);
}    