
void drawUI() {
  men.loop();
  r=random(0, 3);
  r=map(r, 0, 3, 50, 530);
  i=random(0, 3);
  i=map(i, 0, 3, 50, 930);
  if (mousePressed&&mouseX>50&&mouseX<width/2-50
    &&mouseY>height-180&&mouseY<height-30) {
    a=0;
    v=0;
    d=30;
    men.stop();
  } else if (mousePressed&&mouseX>width/2+50&&mouseX<width-50
    &&mouseY>height-180&&mouseY<height-30) {
    a=-2;
  }
  w=0;
  fill(#D4FFCE);
  rect(50, height-180, width/2-100, 130);
  rect(width/2+50, height-180, width/2-100, 130);
  fill(#FF0000);
  rect(r, i, 50, 50);
  textSize(39);
  fill(#165031);

  text("(DON'T TOUCH THE BORDERS)", 4, height/4+100);
  textSize(60);
  text("SNAKE BALL", width/5, height/4);

  textSize(30);
  fill(0);
  text("PLAY!", 85, height-100);
  text("How to play?", width/2+51, height-100);
  textSize(30);

  fill(0, 0, 255);
  ellipse(mouseX, mouseY, 50, 50);
}