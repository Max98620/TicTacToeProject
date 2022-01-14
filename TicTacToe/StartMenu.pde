//Global variables
int textsize = 60;
String SinglePlayer = "Single Player";
String MultiPlayer = "Two Player";
int textX = 10, textY = 50;
int ScoreX = 225, ScoreY = 675;
String Board = (Xscore + "-" + Oscore);

void buttonSetup() {
  textSize(textsize);
  
}

void startMenu() {
  fill(0);
  rect(textX, textY, textWidth(MultiPlayer), textsize);
  fill(255);
  text(MultiPlayer, textX, textY+50);
}

void scoreBoard() {
  text(Board,ScoreX, ScoreY);
}

void ElPoopso() {
      textSize(64);
      x += 10 * xdir;
  y += 10 * ydir;
  if (x + textWidth("el Poopso") > width || x < 0) {
    xdir *= -1;
  }
  if (y > height || y <0) {
    ydir*= -1;
  }
  fill(255,0,0);
  
  text("El poopso", x, y);
}
