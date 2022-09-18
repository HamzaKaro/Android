int couleur=#ffffff;
int pos=20;
void setup()
{
  fullScreen();
  background(#ffffff);
  orientation(LANDSCAPE);
  
}
void draw()

{    fill(#DBC923);
stroke(#000000);
   
  rect(width-50,-10,100,height+200);
  
  rect(-50,-10,150,height+100);
   fill(couleur);
  ellipse(width-50,10,10,10);
  ellipse(width-50,height/2-50,50,50);
  ellipse(width-50,height-100,100,100);
  noStroke();
  if(mousePressed){
  if(mouseX>width-90&&mouseX<width&&mouseY>pos-50&&mouseY<pos+50)
  {pos=mouseY;}
  else if(mouseX>100){
    stroke(#000000);
  fill(couleur);
  ellipse(mouseX,mouseY,pos,pos);};}
;
  if (mouseX>50&&mouseX<100&&mouseY>20&&mouseY<100)
  {stroke(#000000);}
  else if(mouseX>25&&mouseX<75&&mouseY>120&&mouseY<200)
  {stroke(#000000);}
  else if(mouseX>25&&mouseX<75&&mouseY>220&&mouseY<300)
  {stroke(#000000);}
  else if(mouseX>25&&mouseX<75&&mouseY>320&&mouseY<400)
  {stroke(#000000);}
  else if(mouseX>25&&mouseX<75&&mouseY>420&&mouseY<500)
  {stroke(#000000);}
   else if(mouseX>25&&mouseX<75&&mouseY>420&&mouseY<500)
  {stroke(#000000);}else{noStroke();};
  
  fill(#8E1E1E);
  ellipse(50,50,50,50);
  fill(#868E1E);
  ellipse(50,150,50,50);
  fill(#1BE809);
  ellipse(50,250,50,50);
  fill(#103B34);
  ellipse(50,350,50,50);

  fill(couleur-100);
  rect(width-50,pos,30,50);
   fill(#F7F5E1);
  rect(25,450,50,50);

 
}
void mousePressed()
{
  if (mouseX>50&&mouseX<100&&mouseY>20&&mouseY<100)
  {couleur=#8E1E1E;stroke(#000000);}
  else if(mouseX>25&&mouseX<75&&mouseY>120&&mouseY<200)
  {couleur=#868E1E;stroke(#000000);}
  else if(mouseX>25&&mouseX<75&&mouseY>220&&mouseY<300)
  {couleur=#1BE809;stroke(#000000);}
  else if(mouseX>25&&mouseX<75&&mouseY>320&&mouseY<400)
  {couleur=#103B34;stroke(#000000);}
  else if(mouseX>25&&mouseX<75&&mouseY>420&&mouseY<500)
  {background(#ffffff);noStroke();}
  
   
  
  
}