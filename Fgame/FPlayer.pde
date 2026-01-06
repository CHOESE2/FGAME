class FPlayer extends FGameObject {
    int frame;
    int direction;
  
    
    
  FPlayer() {
    super();
    frame = 0;
    direction = R;
    setPosition(300, 0);
    setName("player");
    setRotatable(false);
    setFillColor(white);
  }

  void act() {
    handleInput();
    collisions();
    animate();
  }

  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 7 == 0){
      if (direction == R) attachImage(action[frame]);
      if (direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }

  void collisions() {
    if (isTouching("spike")) {
      setPosition(300, 0);
    }
  }

  void handleInput() {
    float vx =  getVelocityX();
    float vy =  getVelocityY();
    if (abs(vy) < 0.1){
      action = idle;
    }
    
    
    if (akey) {
      setVelocity(-150, vy);
      action = run;
      direction = L;
    }
    if (dkey) {
      setVelocity(150, vy);
      action = run;
      direction = R;
  }
  
    if (wkey && touchingSomething(player)) {
      player.setVelocity(vx, -300);
    }
  
  if (abs(vy) > 0.1)
  action = jump;
  }
  
  
  
}
