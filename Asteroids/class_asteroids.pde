class Asteroid extends GameObject {
  Asteroid() {
    super();
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(random(-1, 1), random(-5, 5));
    lives = 1;
    size = 100;
  }

  Asteroid(float x, float y, int s) {
    super();
    location = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-5, 5));
    lives = 1;
    size = s;
  }

  void show() {
    image(asteroidimg, location.x, location.y, size, size);
  }

  void act() {
    super.act();
    for (int i = 0; i < myGameObjects.size(); i++) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
          myObj.lives = 0;
          lives = 0;
          if(size > 12) {
          myGameObjects.add(new Asteroid(location.x, location.y, size/2));
          myGameObjects.add(new Asteroid(location.x, location.y, size/2));
          println("lol ur bad times " + size);
          }
        }
      }
    }
  }
}
