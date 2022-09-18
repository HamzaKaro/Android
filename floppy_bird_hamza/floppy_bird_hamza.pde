int x=width*10,y,a=0;
int var=200;
int score=0;
float dif=7;
void setup()
{
  fullScreen();
  textSize(100);
  orientation(LANDSCAPE); 
}
void draw()
{if(a==0){
  background(#ffffff);
  fill(#000000);
  text("score:"+score,50,100);
  back();
  bird();
  if(var<y+height/2+50&&x>200&&x<250)
  {a=1;
  }else if (var>height-y/2-20&&x>200&&x<250){a=1;}
  else if (var>height||var<0){a=1;}}
  else{over();}
}
void mousePressed()
{if(a==0){
  var=var-70;
  }
  else{a=0;
score=0;
 x=width;
 var=200;
 dif=7;}
}