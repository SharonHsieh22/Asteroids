class Particle extends GameObject {  
  int timer;
  float x;
  float y;
  
  Particle(float _x, float _y) {
    super();
    location = new PVector(_x, _y);
    velocity = new PVector(random(-5, 5), random(-8, 3));
    //velocity.setMag(6);
    timer = 80;
    size = 2;
    lives = 1;
  }

  void show() {    
    noStroke();
    fill(255);
    ellipse(location.x, location.y, size, size);
  }
  
  void act() {
   super.act(); 
     

  }
  
}
