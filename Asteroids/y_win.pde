void win() {
  background(0);
  image(bgimg, width/2, height/2, width, height);
  textFont(font);
  textSize(60);
  text("YOU WIN", 50, height/2 - 30);
  textSize(28);
  text("NEW HIGHSCORE> " + highscore, 40, height/2 + 50);
}
