class Fsavepoint extends FGameObject {
  int check1;

  Fsavepoint(float x, float y ) {
    super();
    setPosition(x, y);
    setRotatable(false);
    setName("savePoint");
    attachImage(treeTrunk1);
    setStatic(true);
    setFriction(5);
  }


  void act() {

 

}

  
}
