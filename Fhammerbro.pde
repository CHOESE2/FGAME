class FHammerBro extends FGameObject {

  int direction = L;
  int speed = 50;
  int frame = 0;
  boolean hammerCreate;

  int hb = 15;
  boolean  Hbdead;

  FHammerBro(float x, float y) {
    super();
    setPosition(x, y);
    setName("HammerBro");
    setRotatable(false);
    // setSensor(
  }

  void show() {
    //health
    stroke(0);
    strokeWeight(2);
    fill(255);
    rect(vx + 602, vy + 600, 90, 10);
    fill(0, 255, 0);
    rect(vx + 602, vy + 600, hb, 10);

    if (hb < 60) {
      fill(255, 172, 70);
      rect(vx + 602, vy + 600, hb, 10);
    }
    if (hb < 30) {
      fill(255, 0, 0);
      rect(vx + 602, vy + 600, hb, 10);

      if (hb <= 0) {
        // mode = DEFEAT;
        hb = 0;
        Hbdead = true;
      }
    }
  }

  void display() {
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

    if (isTouching("player") && mkey) {
      hb -= 5;
    }

    //if(isTouching("savePoint") && Gdead){

    //}
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);

    if (Hbdead) {
      background(255, 0, 0);
      // setVelocity( player.getVelocityX(), player.getvelocityY() );
      fill(255);
      rect(600, 600, 100, 100);
    }

    if (random(0, 1000) < 5) {
      makeBoxx();
    }
  }


  void makeBoxx() {

   
      hammerbro = new FBox(getVelocityX(), getVelocityY());
      hammerbro.setPosition(300, 0);

      //set visuals

      hammerbro.attachImage(hammer);
      hammerbro.setStroke(0);
      hammerbro.setStrokeWeight(2);
      hammerbro.setFillColor(255);

      //set physical properties
      hammerbro.setDensity(0.2);
       hammerbro.setVelocity(getX(), -200);
       hammerbro.setSensor(true);
      hammerbro.setFriction(3);
      hammerbro.setRestitution(0.25);
      world.add(hammerbro);
    }
  }
