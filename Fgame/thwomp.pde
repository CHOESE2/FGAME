class FThwomp extends FGameObject {

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
    if (thwompOn) {
      attachImage(thwomp2);
      setStatic(false);
    }
  }
}
