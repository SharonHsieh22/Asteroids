void game() {
   background(0);
  int i = 0;
  while (i < myGameObjects.size()) {
    GameObject myObj = myGameObjects.get(i);
    myObj.show();
    myObj.act();
    if(myObj.lives == 0) {
     myGameObjects.remove(i);
    } else {
    i++;
    }
  }
  myShip.show();
  myShip.act();
}
