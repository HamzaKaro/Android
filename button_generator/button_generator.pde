
//import ketai.ui.*;   //  android

int a=50,b=50,i=0;
String s;
float [][][][] x= new  float [50][50][50][50];
PrintWriter  output;


String n;
PImage back;
void setup()
{ back= loadImage("b.png");
  n="bouton.txt";
  output= createWriter(n);
  size(270,480);

}
void draw ()
{image(back,0,0,width,height );
  fill(#ff5232,100);
  rect(mouseX,mouseY,a,b);


  s="X="+mouseX+"..Y="+mouseY+"..a="+a+"..b="+b;
  fill(#ffffff);
  text(s,50,50);

// KetaiKeyboard.show(this);   //   android
}
  void keyReleased()
{
  if (key=='z'){b=b+3;}
  else  if (key=='s'){b=b-3;}
  else  if (key=='d'){a=a+3;}
  else  if (key=='q'){a=a-3;}
  else  if (key=='e')
  {
    save();
  };
  
}
void save ()
{  i++;
  
  background (#ffffff);
  x[i][0][0][0]=mouseX;
  x[0][i][0][0]=mouseY;
  x[0][0][i][0]=a;
  x[0][0][0][i]=b;
  
  output.println(  "if((mouseX>=(width/"+width/(x[i][0][0][0])+"))&& (mouseX<=(width/("+
  width/(x[i][0][0][0]+x[0][0][i][0])+")))&& (mouseY>=(height/("+
height/(x[0][i][0][0])+")))&& (mouseY<=(height/("+height/(x[0][i][0][0]+x[0][0][0][i])+")))){}");
  output.flush();

}
void mousePressed()
{
  
if((mouseX>=(width/10.8))&& (mouseX<=(width/(1.0671936)))&& (mouseY>=(height/(1.1428572)))&& (mouseY<=(height/(1.0457517))))
{screen2();}
else if((mouseX>=(width/1.3846154))&& (mouseX<=(width/(1.2217195)))&& (mouseY>=(height/(68.57143)))&& (mouseY<=(height/(13.333333))))
{screen2();};
}
void screen2()
{for (int b=0;b<10;b++){background(0);};
 
}