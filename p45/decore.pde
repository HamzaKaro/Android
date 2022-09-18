int x,y,a,x1,y1,saut,nbr,nouv,xe,ye,coul,xxe1,xxe,dif=8,scene=1,score=0;
void decore()
{if (x>=width){
  a=int(random(8))*width/8;}
  if(x+a+width/4+150<=0){x=width+10;x1=-width/2;nbr++;if(dif!=10){dif++;}score++;}
  rect(x1,0,width/4-25,height);//limite
  rect(0,height-20,width,50);//sol
  rect(x,y,50,300);//tuyau
  rect(x+a,y,50,300);//tuyau2
  
}