class FGameObject extends FBox {
  final int L = -1;
  final int R = 1;
  
  boolean thwompOn;

  FGameObject() {
    super(gridSize/1.5, gridSize/1.5);
  }


  void act() {
  }

  boolean isTouching(String n) {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if (fc.contains(n)) {
        return true;
      }
    }
    return false;
  }
}
