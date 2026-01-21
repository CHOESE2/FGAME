void game() {

  background(black);
  drawWorld();
  actWorld();
  
  if (!BgMusic.isPlaying()) {
    BgMusic.play();
  }
  
  
  fill(255);
  tactile(20, 20, 50, 10);
  rect(20, 20, 50, 10);

  textSize(20);
  fill(255);
  stroke(0);


  //NPC
  if (!emeraldOn) {
    if (player.getX() > 640 && player.getX() < 680 && player.getY() > 400 && player.getY() < 425) {

      if (DNPC == 0) {
        textFont(chees);
        rect(100, 320, 500, 100);
        fill(0);
        textSize(15);
        text("pst...PST! cmere..", 200, 370);
        textSize(10);
        text("~press ' m ' to continue~", 280, 395);
        if (mkey) {
          DNPC = 1;
        }
      }
      if (DNPC == 1) {

        rect(100, 320, 500, 100);
        fill(0);
        textSize(15);
        text("pls help me find the sacred emerald !!", 140, 360);
        text("you'll be rewarded a hefty sum..heh", 140, 383);
        textSize(10);
         text("~QUEST: find sacred emerald~", 280, 410);
 
      }
    }
  }//-------------emerald
  else if (emeraldOn) {
    if (player.getX() > 640 && player.getX() < 680 && player.getY() > 400 && player.getY() < 425) {

      if (DNPC == 0) {

        rect(100, 320, 500, 100);
        fill(0);
        textFont(chees);
        textSize(15);
        text("IS THAT THE EMERALD !!", 200, 365);
        textSize(10);
        text("~press ' m ' to continue~", 280, 395);
        if (mkey) {
          DNPC = 1;
        }
      }
      if (DNPC == 1) {
        textFont(chees);
        rect(100, 320, 500, 100);
        fill(0);
        textSize(15);
        text("hehe.. you fool", 200, 380);
        npcGONE = true;
      }
    }
  }//-----------------------emerald2

  if (!npcGONE)

    if (player.getX() > 750 && player.getX() < 780 && player.getY() > 960 && player.getY() < 980 && !emeraldOn) {
      emeraldOn = true;
      image(emerald, 300, 200, 30, 30);
    }


  if (player.getX() > 750 && player.getX() < 775 && player.getY() > 395 && player.getY() < 418 && !keyTaken) {
    keyOn = false;
    keyTaken = true;
   
  }

  // rect(790, 725, 100, 40);

  if (player.getX() > 790 && player.getX() < 890 && player.getY() > 725 && player.getY() < 765 && !keyTaken) {
    fill(255);
    rect(100, 320, 500, 100);
    fill(0);
    textSize(15);
    text("~ key required for access ~", 182, 360);
    text("HINT: get a certain emerald", 180, 390);
  }

  if (player.getX() > 790 && player.getX() < 890 && player.getY() > 725 && player.getY() < 765 && keyTaken ) {
    fill(255);
    rect(100, 320, 500, 100);
    textFont(chees);
    fill(0);
    textSize(15);
    text("~press ' m ' key to open~", 200, 375);

    if (mkey) {
      MODE = GAMEOVER;
    }
  }
  //-------------------------
}

//---------------------------------
void actWorld() {
  player.display();


  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
}
//----------------------------------------

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom + width/2, -player.getY()*zoom + height/2);
  scale(zoom);

  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.show();

    if (player.getX() > jx && player.getX() < jx + 20 && player.getY() < jy  && player.getY() > jy - 15) {
      if (isTouching1("jump")) {
        image(t1[j], jx, jy, 30, 30); //maybe make in the center of the screen
        println(frameCount);
        if (frameCount % 12 == 0) j += 1;
        if (j == jCount) j = 0;
      } else {
        image(t1[0], jx, jy, 30, 30);
      }
    }
  }



  stroke(255);
  fill(255);
  rect(281, 220, 55, 10);

  stroke(255);
  fill(255);
  rect(400, 860, 55, 10);

  //rect(655, 200, 85, 100); // thwomp hit box

  stroke(0);
  fill(255);
  rect(1260, 1050, 55, 10); //jump
  //rect(640, 400, 40, 25); //npc

  if (!npcGONE) {
    image(npc1, nx, 390, 30, 30);
  } else {

    nx += 3;
    image(npc1, nx, 390, 30, 30);
    keyOn = true;
  }

  if (keyOn && !keyTaken) {
    image(keyy, 750, 395, 25, 23);
  } else {
    keyOn = false;
  }

  //rect(790, 725, 100, 40); //door hitbox


  if (!emeraldOn) {
    image(emerald, 750, 960, 30, 30);
  }




  world.step();
  world.draw();
  popMatrix();
}




//-------------------------------------------------

void gameClicks() {
  MODE = PAUSE;
}
