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
   


    if (player.getX() > 655 && player.getX() < 740 && player.getY() > 200 && player.getY() < 300 && !TON){
      Tm1 = 1;
    } else {
      Tm1 = 0;
    }
   

  if (Tm1 == 0) {
      attachImage(thwomp1);
      setStatic(true);
      
    }

    if (Tm1 == 1 && !TON) {
      attachImage(thwomp2);
      setStatic(false);
     if (abs(vy) < 0.1) {
        Tm1 = 3;
    

      }
    }

     else if (abs(vy) < 0.1 && Tm1 == 3) {
      TON = true;
      attachImage(thwomp2);
     
    }
    
    if (TON){
       vy -= 5;
      
    }
  }
  
  void collide(){
   
      
      
  }
    
 
}
