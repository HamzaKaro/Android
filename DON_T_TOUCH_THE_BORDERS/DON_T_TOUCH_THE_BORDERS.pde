import cassette.audiofiles.*;
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


void setup()
{ 
  smooth();
  orientation(PORTRAIT);
  fullScreen();
  c=new SoundFile(this, "C.mp3");
  go=new SoundFile(this, "GO.mp3");
  men=new SoundFile(this, "menu.mp3");
  importHighscore();
  r=random(0, 3);
  r=map(r, 0, 3, 50, 530);
  i=random(0, 3);
  i=map(i, 0, 3, 50, 930);
}
void draw()
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
    stroke(#FF0000);
    rect(0, 0, width, height-1);
    s="score:"+v;
    rain();
    cond();
    fill(#FAFAFA);
    textSize(30);
    text(s, 30, 30);
  }
}

void cercle()
{  
  noStroke();


  fill(0, 0, 255);
  ellipse(x, y, d, d);
}

void rain() {
  { 
    noStroke();
    fill(#FF0000);
    rect (r, i, 25, 25);



    cercle();
    if (mousePressed) {
      x=mouseX;
      y=mouseY;
    };
  }
}
void cond() {
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
void fin() {

  go.play();
  go.resume();
  updateHighscore();
  background(#AF4956);
  textSize(50);
  text("GAME OVER", width/2-130, height/2-20 ); 
  textSize(30);
  text("(PRESS HERE TO PLAY AGAIN)", 70, height-200);
  fill(#0024FF);
  text("Highscore:"+highscore, width/2-90, height-400);
  fill(#FAFAFA);
  textSize(30);
  text(s, 30, 30);


  if (mousePressed&&mouseX>width/4&&mouseX<width*3/4&&mouseY>height/4&&mouseY>height*3/4) { 
    a=0;
    d=30;
    v=0;
    go.pause();
  }
}
void importHighscore() {
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
    highscore = int(line);
  }
  try {
    reader.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}
void updateHighscore() {
  if (highscore < v) {
    highscore = v;
    // Create a new file in the sketch directory
    output = createWriter("highscore.txt");
    output.println(highscore);
    output.close(); // Writes the remaining data to the file & Finishes the file
  }
}