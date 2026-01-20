class FGhost extends FGameObject {

  int direction = L;
  int speed = 40;
  int frame = 0;

  int gh = 15;
  boolean Ghdead;
  boolean directOn;
  boolean stateMove;
  float dx, dy;
  boolean activeOn = true;




  FGhost(float x, float y) {
    super();
    setPosition(x, y);
    setName("ghost");
    setRotatable(false);
    setSensor(true);
  }

  void show() {
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

    if(isTouching("player") && mkey){
      gh -= 5;
    }
  }

  void move() {
    boolean facingPlayer = (player.direction == R && getX() > player.getX() || player.direction == L && getX() < player.getX() );
    float vy = player.getVelocityY();
    float vx = player.getVelocityX();
    
  

   
      if (facingPlayer) {
        setVelocity(0, 0);
        stateMove = false;
      } else {
        stateMove = true;
        setVelocity(dx, dy);
        dx = player.getX() - getX();
        dy = player.getY() - getY();

        if (dist(player.getX(), player.getY(), getX(), getY()) < 5) {
          setVelocity(dx*0.10, dy);
        }
      }
    }
  

  //---------------------------------
}
