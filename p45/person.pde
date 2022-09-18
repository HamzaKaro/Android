
void person()
{if((az<6)&&bas==false)
     { bas=true;
      y1=y1-200;}
  ellipse(width/4, y1, 50, 50); 
  if (y1<saut) {
    y1=y1+3;
    bas=true;
  } else {
    bas=false;
  };//saut

  if (mousePressed) {
    if (mouseX>width/3*2&&avant==true) {
      x=x-10;
      x1=x1-10;
      if(xxe>width/4){xxe=xxe+10;}else{xxe=xxe-10;};
if(xxe1>width/4){xxe1=xxe1+10;}else{xxe1=xxe1-10;}
    }       //droite
    else if (mouseX<width/3&&arriere==true) {
      x=x+10;
      x1=x1+10;
      if(xxe>width/4){xxe=xxe-10;}else{xxe=xxe+10;};
if(xxe1>width/4){xxe1=xxe1-10;}else{xxe1=xxe1+10;}
    }                    //gauche
    else if ((mouseX<width/3*2&&mouseX>width/3&&bas==false)) {
      bas=true;
      y1=y1-200;
    }//saut
  }
}
void limite()
{ 
  if (y1-25>y) {
    if ((width/4+25<x1+width/4+25)||((width/4+25>x+60)&&(width/4-25<x+50))||((width/4+25>x+a+60)&&(width/4-25<x+a+50)))//limite arriere
    {
      arriere=false;
      avant=true;
    } else {
      arriere=true;
    };
    if ((width/4+25>x&&(width/4+25<x+20))||((width/4+25>x+a)&&(width/4-25<x+a+20))) {//limite droite
      avant=false;
    
    } else {
      avant=true;
    }
  }else if((y1-25<y&&width/4+25>x&&width/4-25<x+50)||(y1-25<y&&width/4+25>x+a&&width/4-25<x+a+50)){saut=y-25;}else{saut=height-45;}
}
void onAccelerometerEvent(float x, float y, float z)
{
      ax = x;
      ay = y;
      az = z;
}