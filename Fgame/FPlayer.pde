class FPlayer extends FGameObject {
  int frame;
  int direction;
  int w = 100;
  boolean save1 = false;
  boolean save2 = false;
  boolean Pdead = false;
  boolean Gdead = false;
  boolean hurting1 = false;
 //int px, py;
  
 
  FPlayer() {
    super();
    frame = 0;
    direction = R;
    setPosition(300, 0);
    setName("player");
    setRotatable(false);
    setFillColor(white);
    
   // loc = new PVector(px, py);
  }

  void show() {
    
  }

  void display() {
    show();
    act();
  
     //health
    stroke(0);
    strokeWeight(2);
    fill(255);
    rect(vx + 302, vy + 190, 90, 10);
    fill(0, 255, 0);
    rect(vx + 302, vy + 190, w, 10);

    if (w < 60) {
      fill(255, 172, 70);
      rect(vx + 302, vy + 190, w, 10);
    }
    if (w < 30) {
      fill(255, 0, 0);
      rect(vx + 302, vy + 190, w, 10);

      if (w <= 0) {
        // mode = DEFEAT;
        w = 0;
        Pdead = true;
      }
    }
  }

  void act() {
    handleInput();
    collisions();
    animate();
  }

  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 7 == 0) {
      if (direction == R) attachImage(action[frame]);
      if (direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }

  void collisions() {
    if (isTouching("spike")) {
      // setPosition(300, 0);
       w -= 1;
    }
    


    if (isTouching("savePoint") && player.getX() >280 && player.getX() < 345 && player.getY() > 210 && player.getY() < 270) {
      save1 = true;
      save2 = false;
    }
    
    if (save1 && Pdead) {
       w = 100;
      setPosition(300, 0);
      Pdead = false;
    }
    //-------------------------------------
    if (isTouching("savePoint") && player.getX() > 370 && player.getX() < 465 && player.getY() > 850 && player.getY()< 880){
      save2 = true;
      save1 = false;
    }
    if (save2 && Pdead){ ///and gdead
      w = 100;
      setPosition(500, 800);
      Pdead = false;
    }
    
    //if (goomba.getVelocityX() <= 0){
    //  Gdead = true;
    //}
    
    if (Gdead){
      background(255, 0, 0);
    }
    
    
    
    if(isTouching("goomba") && !Gdead){
      w -= 2;
    }
    
   

    
    if (isTouching("thwomp")){
      w -= 1; 
    }
    
    if(isTouching("lava")){
      w -= 1;
    }
    
    
  }

  void handleInput() {

    float vx =  getVelocityX();
    float vy =  getVelocityY();

    if (abs(vy) < 0.1) {
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

    if (abs(vy) > 0.1) {
      action = jump;
    }

    if (wkey && touchingSomething(player)) {
      player.setVelocity(vx, -320);
    }
    
    if(mkey){
      action = attack;
    }
  }
  }
