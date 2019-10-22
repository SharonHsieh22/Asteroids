void intro() {
 textFont(font);
 textSize(55);
 background(0); 
 image(bgimg, width/2, height/2, width, height);
 text("<ASTEROIDS>", 50, height/2);
 myShip.lives = 3;
}
