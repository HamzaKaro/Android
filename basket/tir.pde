void tir()
{  
   
      xtir=mouseX;
      ytir=mouseY;
   
    if (mousePressed)
    {
      xin=xtir;
      yin=ytir;
      
      for(int i=xin-level;i>xin-5000;i=i-20){
        ypar=int(sq(i)/(xtir*3))+xtir;
      
      stroke(5);
      fill(#ffffff,alp);
      ellipse(i,ypar-ytir,10,10);
      alp=alp+5;
                              };alp=0;
  
    }

}