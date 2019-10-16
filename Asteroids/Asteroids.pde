boolean upkey, downkey, leftkey, rightkey, spacekey;
PImage shipimg;
PImage asteroidimg;
PImage ufoimg;
Ship myShip;
ArrayList<GameObject> myGameObjects;
int mode;
final int intro = 0;
final int game = 1;
final int gameover = 2;
int points;

void setup() {
  size(800, 600);
  shipimg = loadImage("ship.png");
  asteroidimg = loadImage("asteroid.png");
  ufoimg = loadImage("ufo.png");
  imageMode(CENTER);
  myShip = new Ship();
  myGameObjects = new ArrayList<GameObject>();
  myGameObjects.add(new Asteroid());
  myGameObjects.add(new Asteroid());
  myGameObjects.add(new Asteroid());
  myGameObjects.add(new Asteroid());
  myGameObjects.add(new Asteroid());
}

void draw() {  
  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == gameover) {
    gameover();
  } else {
    println("error" + mode);
  }
}

void keyPressed() {
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (key == ' ') spacekey = true;
}

void keyReleased() {
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (key == ' ') spacekey = false;
}

void mouseReleased() {
  if (mode == intro) {
    mode = game;
  } else if (mode == game) {
   
  } else if (mode == gameover) {
    mode = intro;
  } else {
    println("error" + mode);
  }
}
