
void sound()
{ 
    if(playing){
   coulm=0;
   s1="OFF";
   playing=false;
   m1.stop();
 
  }
  else{    
    coulm=255;
    s1="ON";   
    m1=new SoundFile(this,musique[nm]);
    m1.loop();
    playing=true;
    
  }
  
  
}