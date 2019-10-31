class Grenade extends GameObject {  
  //int timer;

  Grenade() {
    super();
    location = new PVector(width + 40, random(0, height));
    velocity = new PVector(2, 2);
    velocity.setMag(4);
    lives = 1;
    timer = 80;
    size = 50;
  }

  void show() {
    noStroke();
    fill(#FFD603);
    image(grenadeimg, location.x, location.y, size, size);
  }

  void act() {
    super.act();
    //timer--;
    //if(timer == 0) {
    // lives = 0; 
    //}
    for (int i = 0; i < myGameObjects.size(); i++) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
          myObj.lives = 0;
          lives = 0;
          for (int j = 0; j < 100; ) {
            myGameObjects.add(new Explosion(location.x, location.y));
            j++;
          }
        }
      }
    }
  }
}
