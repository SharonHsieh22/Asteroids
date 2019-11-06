import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer fire;
AudioPlayer ufo;
AudioPlayer boom;

//playsong.pause();
//playsong.rewind();
//oversong.play();

boolean upkey, downkey, leftkey, rightkey, spacekey;
PImage shipimg;
PImage asteroidimg;
PImage ufoimg;
PImage grenadeimg;
PImage particleimg;
PImage bgimg;
PImage goimg;
PFont font;

Ship myShip;
Ufo myUfo;
ArrayList<GameObject> myGameObjects;
int mode = 0;
final int intro = 0;
final int game = 1;
final int gameover = 2;
final int win = 3;
int points = 0;
int highscore = 0;
int ufoTimer = 0;
int asteroidTimer = 0;
int grenadeTimer = 0;

void setup() {
  size(800, 600);
  shipimg = loadImage("ship.png");
  asteroidimg = loadImage("asteroid.png");
  ufoimg = loadImage("ufo.png");
  particleimg = loadImage("particle.png");
  grenadeimg = loadImage("grenade.png");
  bgimg = loadImage("bg.jpg");
  goimg = loadImage("gameoverbg.jpg");
  font = createFont("Over There.ttf", 100);
  imageMode(CENTER);
  myShip = new Ship();
  myGameObjects = new ArrayList<GameObject>();
  myGameObjects.add(new Asteroid(width/2, height));
  myGameObjects.add(new Asteroid(width, height/2));
  myGameObjects.add(new Asteroid(0, 0));
  myGameObjects.add(new Asteroid(width, height));  
  points = 0;
  highscore = 0;
  ufoTimer = 0;
  asteroidTimer = 0;
  minim = new Minim(this);
  fire = minim.loadFile("fire.wav");
  boom = minim.loadFile("bangMedium.wav");
}

void draw() {  
  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == gameover) {
    gameover();
  } else if (mode == win) {
    win();
  } else {
    println("error" + mode);
  }
}

void keyPressed() {
  if (keyCode == UP || key == 'w') upkey = true;
  if (keyCode == DOWN || key == 's') downkey = true;
  if (keyCode == RIGHT || key == 'd') rightkey = true;
  if (keyCode == LEFT || key == 'a') leftkey = true;
  if (key == ' ') spacekey = true;
}

void keyReleased() {
  if (keyCode == UP || key == 'w') upkey = false;
  if (keyCode == DOWN || key == 's') downkey = false;
  if (keyCode == RIGHT || key == 'd') rightkey = false;
  if (keyCode == LEFT || key == 'a') leftkey = false;
  if (key == ' ') spacekey = false;
}

void mousePressed() {
  if(mode == game) {
    myGameObjects.add(new Grenade());  
  }
}

void mouseReleased() {
  if (mode == intro) {
    mode = game;
  } else if (mode == gameover) {
    mode = intro;
    setup();
  } else if (mode == win) {
    mode = intro;
    setup();
  } else {
    println("error" + mode);
  }
}
