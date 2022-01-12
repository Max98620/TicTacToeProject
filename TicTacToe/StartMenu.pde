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
