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

    float vx =  getVelocityX();
    float vy =  getVelocityY();
    //fill(255);
    //rect(300, 150, 85, 100);


    if (player.getX() > 655 && player.getX() < 740 ){ //&& Tm2! && Tm3!) { //&& player.getY() > 150 && player.getY() < 50){
      Tm1 = 1;
    } else {
      Tm1 = 0;
    }

  if (Tm1 == 0) {
      attachImage(thwomp1);
      setStatic(true);
   
    }



    if (Tm1 == 1) {
      attachImage(thwomp2);
      setStatic(false);
     if (vy <= 0) {
        Tm1 = 3;

      }
    }

   else if (Tm1 == 3) {
    //  TON = true;
      attachImage(thwomp2);
      vy -= 5;
      
       

  
    }
  }
}
