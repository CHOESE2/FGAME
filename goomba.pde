class FGoomba extends FGameObject {

  int direction = L;
  int speed = 50;
  int frame = 0;
  
  int g = 15;
  boolean  Gdead;

  FGoomba(float x, float y) {
    super();
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
  }

void show(){
    //health
    stroke(0);
    strokeWeight(2);
    fill(255);
    rect(vx + 602, vy + 600, 90, 10);
    fill(0, 255, 0);
     rect(vx + 602, vy + 600, g, 10);

    if (g < 60) {
      fill(255, 172, 70);
      rect(vx + 602, vy + 600, g, 10);
    }
    if (g < 30) {
      fill(255, 0, 0);
       rect(vx + 602, vy + 600, g, 10);

      if (g <= 0) {
        // mode = DEFEAT;
        g = 0;
        Gdead = true;
      }
    }
}

void display(){
  act();
  show();
}

  void act() {
    animate();
    collide();
    move();
  }


  void animate() {
    if (frame >= goomba.length) frame = 0;
    if (frameCount % 10 == 0) { //speed
      if (direction == R) attachImage(goomba[frame]);
      if (direction == L) attachImage(reverseImage(goomba[frame]));
        frame++;
    }
  }

  void collide() {
    if (isTouching("Invside")) {
      direction *= -1;
      setPosition(getX() + direction, getY());
    }
    
    if(isTouching("player") && mkey){
      g -= 5;
    }
    
    //if(isTouching("savePoint") && Gdead){
      
    //}
    
    
    
   
  }
  
  void move(){
   float vy = getVelocityY();
   setVelocity(speed*direction, vy);
   
    if (Gdead){
      background(255, 0, 0);
     // setVelocity( player.getVelocityX(), player.getvelocityY() );
      fill(255);
      rect(600, 600, 100, 100);
      
    }
  }
  
}
