
void back()
{ if(x<=50){y=int(random(3))*20;x=width;score++;}else{
  x=x-int(dif);
  fill(#4FA53C);
  rect(x,y,50,height/2+50);
  rect(x,height-y,50,height/2-20);}
  dif=dif+0.001;
  }