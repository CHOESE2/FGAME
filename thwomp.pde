class FThwomp extends FGameObject {
  int Tmode;
  int Tm1;


  boolean TON;
  //int Tm2 = 1;
  //int Tm3 = 2;


  FThwomp(float x, float y ) {
    super();
    setPosition(x, y);
    setRotatable(false);
    setName("thwomp");
    attachImage(thwomp1);
    setStatic(true);
    setFriction(4);
  }


  void act() {

    collide();

    float vx =  getVelocityX();
    float vy =  getVelocityY();
    //fill(255);


    if (Tm1 == 0) {
      attachImage(thwomp1);
      setStatic(true);

      if (player.getX() > 655 && player.getX() < 740 && player.getY() > 200 && player.getY() < 300 && !TON) {

        Tm1 = 3;
        attachImage(thwomp2);
        setStatic(false);
      }
    } else if (Tm1 == 3) {

      if (abs(getVelocityY()) < 0.1) {
        TON = true;
        setStatic(false);
        attachImage(thwomp2);
        Tm1 = 4;
      }
    }

    if (Tm1 == 4) {
      setVelocity(0, -30);
      if (getY() <= 190) {
        setPosition(getX(), 190);
        setVelocity(0, 0);
        setStatic(true);
        Tm1 = 0;
        attachImage(thwomp1);
        TON = false;
      }
    }
  }

  void collide() {
  }
}
