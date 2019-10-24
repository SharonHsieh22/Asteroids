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
  if (ufoTimer >= 200) {
    myGameObjects.add(new Ufo());
    ufoTimer = 0;
  }
  asteroidTimer++;
  if (asteroidTimer >= 100) {
    myGameObjects.add(new Asteroid(width + 50, random(0, height)));
    asteroidTimer = 0;
  }
  fill(255);
  textSize(20);
  text("POINTS> " + points, 50, 80);
  text("LIVES> " + myShip.lives, width - 200, 80);
}
