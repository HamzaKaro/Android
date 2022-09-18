package processing.test.don_t_touch_the_borders;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import cassette.audiofiles.*; 

import com.google.ads.*; 
import com.google.ads.internal.*; 
import com.google.ads.mediation.*; 
import com.google.ads.mediation.admob.*; 
import com.google.ads.mediation.customevent.*; 
import com.google.ads.searchads.*; 
import com.google.ads.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class DON_T_TOUCH_THE_BORDERS extends PApplet {


SoundFile go, men, c;

BufferedReader reader;
PrintWriter output;
int x=160;
int y =200;
int tel;
float r;
int a=-1;
float i;
String s;
int d=20;
int j=0;
String b;
int v;
int g=30, p=30;
int w=0;
int highscore;


public void setup()
{ 
  
  orientation(PORTRAIT);
  
  c=new SoundFile(this, "C.mp3");
  go=new SoundFile(this, "GO.mp3");
  men=new SoundFile(this, "menu.mp3");
  importHighscore();
  r=random(0, 3);
  r=map(r, 0, 3, 50, 530);
  i=random(0, 3);
  i=map(i, 0, 3, 50, 930);
}
public void draw()
{
  background(w); 
  s="score:"+v;
  if (a==-1) { 
    drawUI();
  } else if (a==-2) {
    help();
  } else if (a==-3) {
    fin();
  } else {
    noFill();
    stroke(0xffFF0000);
    rect(0, 0, width, height-1);
    s="score:"+v;
    rain();
    cond();
    fill(0xffFAFAFA);
    textSize(30);
    text(s, 30, 30);
  }
}

public void cercle()
{  
  noStroke();


  fill(0, 0, 255);
  ellipse(x, y, d, d);
}

public void rain() {
  { 
    noStroke();
    fill(0xffFF0000);
    rect (r, i, 25, 25);



    cercle();
    if (mousePressed) {
      x=mouseX;
      y=mouseY;
    };
  }
}
public void cond() {
  if (x+d*2/3>r&&x-d*2/3<r&&y+d*2/3>i&&y-d*2/3<i)
  {
    c.play();

    r=random(0, 3);
    r=map(r, 0, 3, 50, width-20);
    i=random(0, 3);
    i=map(i, 0, 3, 50, height-20);
    v++;
    if (d<480) {
      d++;
    }
  } else if (x>=width-d/2||x<=d/2||y>=height-d/2||y<=d/2) {
    a=-3;
  }
}
public void fin() {

  go.play();
  go.resume();
  updateHighscore();
  background(0xffAF4956);
  textSize(50);
  text("GAME OVER", width/2-130, height/2-20 ); 
  textSize(30);
  text("(PRESS HERE TO PLAY AGAIN)", 70, height-200);
  fill(0xff0024FF);
  text("Highscore:"+highscore, width/2-90, height-400);
  fill(0xffFAFAFA);
  textSize(30);
  text(s, 30, 30);


  if (mousePressed&&mouseX>width/4&&mouseX<width*3/4&&mouseY>height/4&&mouseY>height*3/4) { 
    a=0;
    d=30;
    v=0;
    go.pause();
  }
}
public void importHighscore() {
  // Open the file from the createWriter()
  reader = createReader("highscore.txt");
  if (reader == null) {
    highscore = 0;
    return;
  }
  String line;
  try {
    line = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if (line != null) {
    highscore = PApplet.parseInt(line);
  }
  try {
    reader.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}
public void updateHighscore() {
  if (highscore < v) {
    highscore = v;
    // Create a new file in the sketch directory
    output = createWriter("highscore.txt");
    output.println(highscore);
    output.close(); // Writes the remaining data to the file & Finishes the file
  }
}
public void help() {

  if (mousePressed&&mouseX>width/2-100&&mouseX<(width/2-100)*2
    &&mouseY>height-180&&mouseY<height-30) {
    a=-1;
  }
  fill(0xffD4FFCE);
  rect(width/2-100, height-180, width/2-100, 130);
  fill(0xffFFFFFF);
  textSize (19);
  text("*Collect the red rectangles but don't touch the screen's borders.", 1, 400);
  text("*By collecting those rectangles your diameter will increase ", 1, 500);
  text("*and you'll get magnetic power.", 1, 600);

  textSize(39);
  fill(0xff165031);

  text("(DON'T TOUCH THE BORDERS)", 4, height/5+100);
  textSize(60);
  text("SNAKE BALL", width/5, height/5);


  textSize (23);
  fill(0);
  text("RETURN", width/2-60, height-110);
  fill(0, 0, 255);
  ellipse(mouseX, mouseY, 50, 50);  
  fill(0, 0, 255);
  ellipse(mouseX, mouseY, 50, 50);
}

public void drawUI() {
  men.loop();
  r=random(0, 3);
  r=map(r, 0, 3, 50, 530);
  i=random(0, 3);
  i=map(i, 0, 3, 50, 930);
  if (mousePressed&&mouseX>50&&mouseX<width/2-50
    &&mouseY>height-180&&mouseY<height-30) {
    a=0;
    v=0;
    d=30;
    men.stop();
  } else if (mousePressed&&mouseX>width/2+50&&mouseX<width-50
    &&mouseY>height-180&&mouseY<height-30) {
    a=-2;
  }
  w=0;
  fill(0xffD4FFCE);
  rect(50, height-180, width/2-100, 130);
  rect(width/2+50, height-180, width/2-100, 130);
  fill(0xffFF0000);
  rect(r, i, 50, 50);
  textSize(39);
  fill(0xff165031);

  text("(DON'T TOUCH THE BORDERS)", 4, height/4+100);
  textSize(60);
  text("SNAKE BALL", width/5, height/4);

  textSize(30);
  fill(0);
  text("PLAY!", 85, height-100);
  text("How to play?", width/2+51, height-100);
  textSize(30);

  fill(0, 0, 255);
  ellipse(mouseX, mouseY, 50, 50);
}
  public void settings() {  fullScreen();  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "DON_T_TOUCH_THE_BORDERS" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
