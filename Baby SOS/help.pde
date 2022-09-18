void aide() {
  
  background(#DCF5C6);
  image(fond, width/4, height/2, width/2, height/2);
  stroke(0);
  fill(#E3EFFC,random(100));
  rect(width/3, height/8*6, 160, 80);
  textSize(18);

  fill(0);
  text("this app is created for parents to help them to deal  ", 1, 60);
  text("with their babies.", 1, 80);
  text("It plays baby's musics,turns on soft light automatically", 1, 100);
  text("or manually by connecting", 1, 120);
  text("two devices via WIFI (don't worry it's very easy):", 1, 140);
  text("1)Just make sur you are both connected to the same wifi network", 1, 160);
  text("and each device has already installed this app", 1, 180);
  text("2)then copy each device's IP adress(provided in settings)", 1, 200);
  text("on the other device(in the settings)", 1, 220);
  text("The remote device is alarmed if the baby cries.", 1, 240);
  text("**DON'T FORGET TO PUT THE LOCAL DEVICE IN A SILENT**", 1, 300);
  text("**ROOM SO THAT IT CAN PERFECTLY HEAR THE BABY**", 1, 330);
  text("**THE LOCAL DEVICE MUST BE CLOSE TO THE BABY**", 1, 360);
  text("**(THE PERFECT DISTANCE IS <3 M>)**", 1, 390);
  text("**YOU CAN OPEN AN ACCESS POINT ON ONE DEVICE**", 1, 420);
  text("** AND CONNECT THE OTHER ONE TO IT**", 1, 450);
  fill(#FF0000);
  text("MENU", width/3+50, height/8*6+50);
}