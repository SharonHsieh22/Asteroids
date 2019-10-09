class Asteroid extends GameObject {
  Asteroid() {
    super();
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(random(-1, 1), random(-5, 5));
  }
  
  void show() {
    image(asteroidimg, location.x, location.y, 100, 100);
  }
  
  void act() {
    super.act();
    for(int i = 0; i < myGameObjects.size(); i++) {
     GameObject myObj = myGameObjects.get(i);
     if(myObj instanceof Bullet) {
      if(dist(myObj.location.x, myObj.location.y, location.x, location.y) < 50) {
       alive = false;
      }
     }
    }
  }
}
