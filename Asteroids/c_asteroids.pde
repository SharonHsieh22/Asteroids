class Asteroid extends GameObject {
  Asteroid(float x, float y) {
    super();
    location = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-5, 5));
    velocity.setMag(2);
    lives = 1;
    size = 100;
  }

  Asteroid(float x, float y, int s) {
    super();
    location = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-5, 5));
    velocity.setMag(2);
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
      if (myObj instanceof Bullet || myObj instanceof Explosion) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
          myObj.lives = 0;
          lives = 0;
          for (int j = 0; j < 100; ) {
            myGameObjects.add(new Particle(location.x, location.y));
            j++;
          }
          if (size > 50) {
            points = points + 10;
          } else if (size > 25) {
            points = points + 100;
          } else if (size > 12) {
            points = points + 1000;
          } else if (size > 6) {
            points = points + 10000;
          }
          if (size > 12) {
            myGameObjects.add(new Asteroid(location.x, location.y, size/2));
            myGameObjects.add(new Asteroid(location.x, location.y, size/2));
          }
        }
      }
    }
  }
}
