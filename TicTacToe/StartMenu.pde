//Global variables
int textsize = 60;
String SinglePlayer = "Single Player";
String MultiPlayer = "MultiPlayer";
int textX = 10, textY = 50;
int ScoreX = 225, ScoreY = 675;
String Board = (str(Xscore) + "-" + str(Oscore));

void buttonSetup() {
  textSize(textsize);
  
}

void startMenu() {
  fill(0);
  rect(textX, textY, textWidth(MultiPlayer), textsize);
  fill(255);
  text(MultiPlayer, textX, textY+50);
  
  fill(0);
  rect(textX, textY + 80, textWidth(SinglePlayer), textsize);
  fill(255);
  text(SinglePlayer, textX, textY+130);
}

void difficulty(){
  fill(0);
  rect(textX, textY, textWidth("Easy"), textsize);
  fill(255);
  text("Easy", textX, textY+50);
  
  fill(0);
  rect(textX, textY + 80, textWidth("Hard"), textsize);
  fill(255);
  text("Hard", textX, textY+130);
}

void scoreBoard() {
  text(Board,ScoreX, ScoreY);
}
