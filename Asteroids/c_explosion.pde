class Explosion extends GameObject {  
  //int timer;
  float x;
  float y;
  
  Explosion(float x, float y) {
    super();
    location = new PVector(x, y);
    velocity = new PVector(random(-5, 5), random(-8, 3));
    //velocity.setMag(6);
    timer = 80;
    size = 4;
    lives = 1;
  }

  void show() {    
    noStroke();
    fill(#FFA600, timer*4);
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
