class uBullet extends GameObject {  
  //int timer;
  
  uBullet(float x, float y) {
    super();
    location = new PVector(x, y);
    velocity = new PVector(myShip.location.x - location.x, myShip.location.y - location.y);
    velocity.setMag(4);
    lives = 1;
    timer = 120;
    size = 10;
  }

  void show() {
    noStroke();
    fill(180);
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
