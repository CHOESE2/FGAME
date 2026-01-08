class FGround extends FGameObject {

  FGround(float x, float y ) {
    super();
    setPosition(x, y);
    setRotatable(false);
    setName("ground");
    attachImage(stone);
   
  }


  void act() {
    if (isTouching("player")) {
      thwompOn = true;
    }
  }
}
