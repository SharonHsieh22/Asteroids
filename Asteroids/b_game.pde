void game() {
  background(0);
  int i = 0;
  while (i < myGameObjects.size()) {
    GameObject myObj = myGameObjects.get(i);
    myObj.show();
    myObj.act();
    if (myObj.lives == 0) {
      myGameObjects.remove(i);
    } else {
      i++;
    }
  }
  if (myShip.lives > 0) {
    myShip.show();
    myShip.act();
  } else {
    mode = gameover;
  }
  ufoTimer++;
  if (ufoTimer >= 2000) {
    myGameObjects.add(new Ufo());
    ufoTimer = 0;
  }
  fill(255);
  textSize(40);
  text("POINTS:" + points, 50, 80);
}
