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

    if (random(0, 100) < 5) {
      makeBoxx();
    }
  }


  void makeBoxx() {
    float randomX = random(-300, 300);
    float randomY = random(-500, 0);

    hammerbro = new FBox(10, 10);
    hammerbro.setPosition(getX(), getY());

    //set visuals

    hammerbro.attachImage(hammer);
    hammerbro.setStroke(0);
    hammerbro.setStrokeWeight(2);
    hammerbro.setFillColor(255);

    //set physical properties
    hammerbro.setDensity(0.2);
    hammerbro.setName("hammer");
    hammerbro.setVelocity(randomX, randomY);
    hammerbro.setSensor(true);
    hammerbro.setFriction(3);
    hammerbro.setAngularVelocity(4);
    hammerbro.setRestitution(0.25);
    world.add(hammerbro);
  }
}
