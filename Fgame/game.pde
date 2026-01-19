void game() {
  background(black);
  drawWorld();
  actWorld();

  fill(255);
  tactile(20, 20, 50, 10);
  rect(20, 20, 50, 10);
  
  
  
}







//-------------------------------------------------------------------------------------------------
void actWorld() {
  player.display();


  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom + width/2, -player.getY()*zoom + height/2);
  scale(zoom);

  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.show();
  }


  stroke(255);
  fill(255);
  rect(281, 220, 55, 10);

  stroke(255);
  fill(255);
  rect(400, 860, 55, 10);

  //rect(655, 200, 85, 100); // thwomp hit box

  world.step();
  world.draw();
  popMatrix();
}







void gameClicks() {
  MODE+= 1;
}
