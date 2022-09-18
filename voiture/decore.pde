void decore()
{
  fill(#7C1D14);
if (y>height+200){y=-200;x=int(random(6))*90;score++;}
  rect(0,y,x,200);
  if (x>width/3*2){x1=width-100;
  }else
  {x1=width-400;}
  rect(x1,y,500,200);
  y=y+dif;
    if((millis()/1000)-start/1000>10&&dif<8){dif=dif+5;}
  else if((millis()/1000)-start/1000>20&&dif<10){dif=dif+5;}
  else if((millis()/1000)-start/1000>30&&dif<13){dif=dif+5;}
}