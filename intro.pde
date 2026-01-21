
void intro() {
  background(0);
  textFont(dogo);

  fill(255);
  stroke(Dino);
  strokeWeight(2);
  textSize(20);

  tea(260, 300, 160, 50);
  rect(260, 300, 160, 50);
  fill(0);
  text("PLAY", 300, 335);

  image(enemy1, 100, 390, 85, 85);
  textSize(60);
  fill(255);

  stroke(Dino);
  strokeWeight(2);
  text("Cave Dino", 95, 200);



  textFont(chees);
  textSize(20);
  // image(


  textSize(40);
  text("=========================================", 0, 20);
  text("=========================================", 0, 500);
}



void tea (int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    strokeWeight(4);
    stroke(255);
  } else {
    stroke(#34a0a4);
    strokeWeight(4);
  }
}


void introClicks() {


  if (mouseX > 260 && mouseX < 420 && mouseY > 200 && mouseY < 350) {
     MODE = GAME; //to the game
   // MODE = GAMEOVER;
    //MODE +=2; //to reset
  }
}
