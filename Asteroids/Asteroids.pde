boolean upkey, downkey, leftkey, rightkey, spacekey;
PImage shipimg;
PImage asteroidimg;
Ship myShip;
ArrayList<GameObject> myGameObjects;

void setup() {
  size(800, 600);
  shipimg = loadImage("ship.png");
  asteroidimg = loadImage("asteroid.png");
  imageMode(CENTER);
  myShip = new Ship();
  myGameObjects = new ArrayList<GameObject>();
  myGameObjects.add(new Asteroid());
  myGameObjects.add(new Asteroid());
  myGameObjects.add(new Asteroid());
  myGameObjects.add(new Asteroid());
}

void draw() {
  background(0);
  int i = 0;
  while (i < myGameObjects.size()) {
    GameObject currentObject = myGameObjects.get(i);
    currentObject.show();
    currentObject.act();
    if(currentObject.alive() == false) {
     myGameObjects.remove(i);
     i--;
    }
    i++;
  }
  myShip.show();
  myShip.act();

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
