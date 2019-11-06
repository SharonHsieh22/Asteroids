void game() {
  background(0);
  textFont(font);
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
  } else if (myShip.lives <= 0) {
    if (points >= highscore) {
      mode = win;
    }
  } else {
    mode = gameover;
  }
  
  ufoTimer++;
  if (ufoTimer >= 300) {
    myGameObjects.add(new Ufo());
    ufoTimer = 0;
  }
  
  asteroidTimer++;
  if (asteroidTimer >= 150) {
    myGameObjects.add(new Asteroid(width + 50, random(0, height)));
    asteroidTimer = 0;
  }
  
  grenadeTimer++;
  if (grenadeTimer >= 400) {
    myGameObjects.add(new Grenade());
    grenadeTimer = 0;
  }
  fill(255);
  textSize(20);
  text("POINTS> " + points, 50, 80);
  text("LIVES> " + myShip.lives, width - 200, 80);
  if (points > highscore) {
    highscore = points;
  }
}
