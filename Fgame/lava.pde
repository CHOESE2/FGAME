class FLava extends FGameObject {

  int speed = 50;
  int frame = 0;

  FLava(float x, float y) {
    super();
    setPosition(x, y);
    setName("lava");
    setRotatable(false);
  }

  void act() {
    animate();
    //collide();
  }


  void animate() {
    
    if (frameCount % 10 == 0) { //speed
      frame++;
    }
    if (frame >= lava.length) frame = 0;
    attachImage(lava[frame]);
  }

//  void collide() {
//    if (touchingSomething(player)) {  
//  }
//}


}
