abstract class GameObject {
  PVector location;
  PVector velocity;
  int lives;
  boolean alive;

  GameObject() {
    alive = true;
  }

  void show() {
  }

  void act() {
    location.add(velocity);
    if (location.x > 900) location.x = -100;
    if (location.x < -100) location.x = 900;
    if (location.y > 700) location.y = -100;
    if (location.y < -100) location.y = 700;
  }

  boolean alive() {
    return alive;
  }
}
