void help() {

  if (mousePressed&&mouseX>width/2-100&&mouseX<(width/2-100)*2
    &&mouseY>height-180&&mouseY<height-30) {
    a=-1;
  }
  fill(#D4FFCE);
  rect(width/2-100, height-180, width/2-100, 130);
  fill(#FFFFFF);
  textSize (19);
  text("*Collect the red rectangles but don't touch the screen's borders.", 1, 400);
  text("*By collecting those rectangles your diameter will increase ", 1, 500);
  text("*and you'll get magnetic power.", 1, 600);

  textSize(39);
  fill(#165031);

  text("(DON'T TOUCH THE BORDERS)", 4, height/5+100);
  textSize(60);
  text("SNAKE BALL", width/5, height/5);


  textSize (23);
  fill(0);
  text("RETURN", width/2-60, height-110);
  fill(0, 0, 255);
  ellipse(mouseX, mouseY, 50, 50);  
  fill(0, 0, 255);
  ellipse(mouseX, mouseY, 50, 50);
}