void driver()
{ 
  fill(#F7D211);
  dx=int(map(rotationX,-10,10,0,width));
  ellipse(dx,height/4*3,100,100);
  over();
}
void over()
{
  if(dx-25<x&&height/4*3+25>y&&height/4*3-25<y+200)
  {
    screen=1;
  }
  else if(dx+25>x1&&height/4*3+25>y&&height/4*3-25<y+200)
  {
    screen=1;
  }
}
void onAccelerometerEvent(float x, float y, float z)
{
  rotationX = y;

}