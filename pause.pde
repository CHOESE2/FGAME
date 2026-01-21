void pause(){
  fill(0);
  stroke(255);
  rect(150, 180, 400, 200);


  textSize(25);
  textFont(dogo);
  fill(255);
  text("PAUSE", 150, 185);
  textSize(20);
  fill(255);
  text(". . . . . . . . . . . . . . . . . . . .", 154, 370);
  textSize(12);
  fill(255);
  text("  ~ [ press 'space' to continue ] ~ ", 175, 340);
  
  fill(255);
  textFont(chees);
  textSize(15);
  text("Hint: unpause the game", 170, 250);  
  
 
}


void pauseClicks(){
  MODE = GAME;
  
}
