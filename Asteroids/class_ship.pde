class Ship extends GameObject {
  //1. Instance variables

  PVector direction;
  int shotTimer;
  int threshold;
  int timer;
  int livesThreshold;

  //2. Constructors
  Ship() {
    super();
    lives = 3;
    shotTimer = 0;
    threshold = 10;
    timer = 0;
    livesThreshold = 50;
    size = 150;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0); 
    direction = new PVector(0, -.1);
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

    for (int i = 0; i < myGameObjects.size(); i++) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof Asteroid) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/4 + myObj.size/2) {
          if (timer <= 0) {
            lives--;
            timer = 75;
          }
          timer--;
          println(lives);
        }
      }
    }
  }
}
