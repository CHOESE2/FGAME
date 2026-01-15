class FGoomba extends FGameObject {

  int direction = L;
  int speed = 50;
  int frame = 0;

  FGoomba(float x, float y) {
    super();
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
  }

void show(){
  
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
    
    if(isTouching("player")){
      
    }
  }
  
  void move(){
   float vy = getVelocityY();
   setVelocity(speed*direction, vy);
    
  }
  
}
