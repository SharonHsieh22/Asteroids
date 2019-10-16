//class Ufo extends GameObject {
//  int timer;
//  int threshold;
//  Ufo() { 
//    location = new PVector(random(0, width), random(0, height));
//    velocity = new PVector(random(-1, 1), random(-5, 5));
//    lives = 1;
//    size = 80;
//    timer = 0;
//    threshold = 100;
//  }

//  void show() {
//    image(ufoimg, location.x, location.y, size, size);
//  }

//  void act() {
//    super.act();

//    for (int i = 0; i < myGameObjects.size(); i++) {
//      GameObject myObj = myGameObjects.get(i);
//      if (myObj instanceof Bullet) {
//        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
//          myObj.lives = 0;
//          lives = 0;
//        }
//      }
//    }

//  }
//}
