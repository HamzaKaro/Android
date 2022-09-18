float ax,ay,az;
void ennemi()
{  coul=#F50707;
  if(nbr!=nouv){

  xe=int(random(height));ye=int(random(height));
}
 fill(coul,100);
 ellipse(xxe,ye,75,75);
 ellipse(xxe1,xe,75,75);
 nbr=nouv;
if(xe>y1){xe=xe-dif;}else{xe=xe+dif;};
if(ye>y1){ye=ye-dif;}else{ye=ye+dif;};
if(xxe>width/4){xxe=xxe-dif;}else{xxe=xxe+dif;};
if(xxe1>width/4){xxe1=xxe1-dif;}else{xxe1=xxe1+dif;}
cond();
}

void cond()
{
  if((xxe>width/4-10&&xxe<width/4+10&&ye>y1-10&&ye<y1+10)||(xxe1>width/4-10&&xxe1<width/4+10&&xe>y1-10&&xe<y1+10))
  {
    scene=2;
  }
}