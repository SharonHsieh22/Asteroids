class Ship extends GameObject {
  //1. Instance variables

  PVector direction;
  int shotTimer;
  int threshold;
  int livesThreshold;
  float timer;
  float alpha;

  //2. Constructors
  Ship() {
    super();
    lives = 3;
    shotTimer = 0;
    threshold = 10;
    timer = 180;
    livesThreshold = 50;
    size = 150;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0); 
    direction = new PVector(0, -.1);
    alpha = 0;
  }

  //3. Behavior functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    image(shipimg, 0, 0, size, size);
    popMatrix();
   }

  void act() {
    shotTimer++;
    super.act();
    if (upkey) velocity.add(direction);
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate(-PI/36);
    if (rightkey) direction.rotate(PI/36);
    if (spacekey && shotTimer >= threshold) {
      myGameObjects.add(new Bullet());  
      shotTimer = 0;
    }

    timer++;
    noFill();
    stroke(255, alpha);
    strokeWeight(10);
    arc(location.x, location.y + 10, 150, 150, PI/2+PI, PI/2+PI+map(timer, 0, 180, 0, TWO_PI), OPEN);
    if(timer > 0 && timer < 20) {
      alpha = 255;
    }
    if(timer > 20 && timer < 180) {
      alpha = alpha - 1.55;
    }
    
    for (int i = 0; i < myGameObjects.size(); i++) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof Asteroid || myObj instanceof uBullet) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/3 + myObj.size/2) {
          if (timer >= 180) {
            lives--;
            timer = 0;
          }
        }
      }
    }    
    println(timer);
  }
}
