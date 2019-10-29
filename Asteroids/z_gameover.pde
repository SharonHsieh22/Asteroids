void gameover() {
  background(0);
  image(goimg, width/2, height/2, width, height);
  textFont(font);
  textSize(60);
  text("GAME OVER", 50, height/2 - 40);
  textSize(30);
  text("HIGHSCORE> " + highscore, 50, height/2 + 50);
}
