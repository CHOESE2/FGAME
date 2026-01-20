void game() {
  background(black);
  drawWorld();
  actWorld();


  fill(255);
  tactile(20, 20, 50, 10);
  rect(20, 20, 50, 10);
  //FBOX
  
 // int i = 0;
 // int boxL = 1;
 // if (i < boxL){
 //makeBoxx();

 // }
 

 
}
//---------------------------------
void actWorld() {
  player.display();
  //GOOM.display();


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

fill(255, 0, 0);
 rect(1260, 1050, 55, 10);

  world.step();
  world.draw();
  popMatrix();
}


//---------------------------------------------------------

//void makeBoxx() {
  
//  if (hammerCreate){
//  hammerbro = new FBox(10, 10);
//  hammerbro.setPosition(300, 0);

//  //set visuals

// hammerbro.attachImage(hammer);
//  hammerbro.setStroke(0);
//  hammerbro.setStrokeWeight(2);
//  hammerbro.setFillColor(255);

//  //set physical properties
//  hammerbro.setDensity(0.2);
//  hammerbro.setFriction(3);
//  hammerbro.setRestitution(0.25);
//  world.add(hammerbro);
//  }
//}
//-------------------------------------------------

void gameClicks() {
  MODE+= 1;
}
