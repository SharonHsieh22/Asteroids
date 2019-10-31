class Particle extends GameObject {  
  //int timer;
  float x;
  float y;
  
  Particle(float x, float y) {
    super();
    location = new PVector(x, y);
    velocity = new PVector(random(-5, 5), random(-8, 3));
    //velocity.setMag(6);
    timer = 70;
    size = 2;
    lives = 1;
  }

  void show() {    
    noStroke();
    fill(#00E3FF, timer*4);
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
