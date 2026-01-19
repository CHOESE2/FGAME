class FGhost extends FGameObject {

  int direction = L;
  int speed = 40;
  int frame = 0;
  
  int gh = 15;
  boolean Ghdead;
  boolean directOn;
  boolean LdirectOn;
  boolean RdirectOn;
  boolean sameDirection;

  FGhost(float x, float y) {
    super();
    setPosition(x, y);
    setName("ghost");
    setRotatable(false);
  }

void show(){
    ////health
    //stroke(0);
    //strokeWeight(2);
    //fill(255);
    //rect(vx + 602, vy + 600, 90, 10);
    //fill(0, 255, 0);
    // rect(vx + 602, vy + 600, gh, 10);

    //if (gh < 60) {
    //  fill(255, 172, 70);
    //  rect(vx + 602, vy + 600, gh, 10);
    //}
    //if (gh < 30) {
    //  fill(255, 0, 0);
    //   rect(vx + 602, vy + 600, gh, 10);

    //  if (gh <= 0) {
    //    // mode = DEFEAT;
    //    gh = 0;
    //    Ghdead = true;
    //  }
    //}
}

  void act() {
    animate();
    collide();
    move();
  }


  void animate() {
    if (frame >= ghost.length) frame = 0;
    if (frameCount % 10 == 0) { //speed
      if (direction == R) attachImage(ghost[frame]);
      if (direction == L) attachImage(reverseImage(ghost[frame]));
        frame++;
    }
  }

  void collide() {
    //if (isTouching("Invside")) {
    //  direction *= -1;
    //  setPosition(getX() + direction, getY());
    //}
    
    //if(isTouching("player") && mkey){
    //  g -= 5;
    //}
    
    
   
   
  }
  
  void move(){
   float vy = player.getVelocityY();
   float vx = player.getVelocityX();
   setVelocity(vx, vy);
   
   
   
   //left
   
   
   //if(akey){  //same direction
   //  LdirectOn = true;
   //  RdirectOn = false;
   //}
   //else if (dkey){  //same direction
   //  RdirectOn = true;
   //  LdirectOn = false;
   //}
  
   //if (direction * player.getVelocityX() < 0){ //opposite direction 
   //  directOn = false;
   //}
   
   
   
   //make this ghost follow player. 
  
   //------------------------------
  
  //    if (LdirectOn ) {
  //      setVelocity(-100, vy);
  //    }
      
  //    else if (RdirectOn ) {
  //      setVelocity( 100, vy);
  //    }
      
      
  //     else if (!directOn) {
  //      setVelocity(0, vy);
  //    }
      
   
    //if (Ghdead){
    //     setVelocity(0, vy);
    //     fill(255);
    //  rect(600, 600, 100, 100);
      
    //}
  }
  
}
