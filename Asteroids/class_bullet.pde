class Bullet extends GameObject {
  
  int age;
  
  Bullet() {
    super();
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(4);
  }

  void show() {
    noStroke();
    fill(255, 0, 0);
    ellipse(location.x, location.y, 10, 10);
  }
  
  void act() {
    super.act();
  }
  
}
