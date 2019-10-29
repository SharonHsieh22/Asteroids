class Ufo extends GameObject {
  int timer;
  int threshold;
  int shotTimer;
  
  Ufo() { 
    location = new PVector(width + 40, random(0, height));
    velocity = new PVector(3, 0);
    lives = 1;
    size = 80;
    shotTimer = 0;
    threshold = 30;
  }

  void show() {
    image(ufoimg, location.x, location.y, size, size);
  }

  void act() {
    super.act();
    shotTimer++;
    if (shotTimer >= threshold) {
      myGameObjects.add(new uBullet(location.x, location.y)); 
      shotTimer = 0;
    }
    

    for (int i = 0; i < myGameObjects.size(); i++) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
          myObj.lives = 0;
          lives = 0;
        }
      }
    }
  }
}
