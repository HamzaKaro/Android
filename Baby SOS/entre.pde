void ent()
{
  aut=#9F9DB9;
  if (playing==true) {
    m1.stop();
  }
  nbr=0;
  h=0;

  connected=false;
  background(#DCF5C6);
  if (mic.isActive()) {
    mic.stop();
  }


  image(fond, width/4, height/3-30, width/2, height/2);




  image(help, width/1.38, height/48, width/10.8, height/19.2);
  image(b, width/16, y, width/8, height/5);
  image(a, width/16+80, y, width/8, height/5);
  image(b, width/16+160, y, width/8, height/5);
  image(ya, width/16+220, y, width/8, height/5);
  textFont(font);
  fill(#FF0000);
  textSize(width/5-10);
  text("S.O.S", width/2-10, y+250);
  textSize(width/10);
  fill(random(255));
  text("Press to Start", width/5, height-60);
}