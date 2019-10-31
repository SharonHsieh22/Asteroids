class Bullet extends GameObject {  
  //int timer;
  
  Bullet() {
    super();
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(6);
    lives = 1;
    timer = 80;
    size = 10;
  }

  void show() {
    noStroke();
    fill(#FFD603);
    ellipse(location.x, location.y, size, size);
  }
  
  void act() {
    super.act();
    timer--;
    if(timer == 0) {
     lives = 0; 
    }
  }
  
}
