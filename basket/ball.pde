void ball()
{
    ypar=int(sq(c)/(xtir*3))+xin;
    stroke(5);
    fill(#ffffff);
    image(angry,c,ypar-ytir,100,100);
    
    c=c+40;
    if(c>=xpan&&c<=xpan+100&&ypar-ytir>=ypan&&ypar-ytir<=ypan+100)
    {
      background(#ff0000);
      score++;
      xpan=-1;
      if(level<1300){
      level=level+50;};
 
    }
    if(ypar-ytir>height&&c>0)
    {
      Screen =1;
      c=xtir-2000;
    }
}