//Global variables
int textsize = 60;
String SinglePlayer = "Single Player";
String MultiPlayer = "MultiPlayer";
int textX = 10, textY = 50;
int ScoreX = 225, ScoreY = 675;
String Board = (str(Xscore) + "-" + str(Oscore));
int EasyX = width/3;
int EasyY = (height/2 + 50);
String turn;

void GetTurn() {
  if (state%2 == 0) {
    turn = "X";
  } else {
    turn = "O";
  }
}

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

void scoreBoard() {
  text(Board,50, ScoreY);
  textSize(60);
  text(turn + "'s Turn", width - 300, ScoreY);
}

void resetButton() {
  fill(255,0,0);
  textSize(60);
  rect(width/3, (height-textsize)-10, textWidth("Reset")+10, textsize);
  fill(255);
  text("Reset", (width/3)+5, (height-textsize)+10);
  if (mousePressed) {
    if (mouseX < (width/3 + textWidth("Reset")+10) && mouseX > width/3 && mouseY < ((height-textsize)-10 + textsize) && mouseY > (height-textsize)-10) {
      reset = 1;
    }
  }
}

void Easy() {
  //Easy
  fill(0);
  rect(textX+40, textY+160, textWidth("Easy"), textsize);
  fill(255);
  text("Easy", textX+40, textY+210);
}
void Hard(){

  //Hard
  fill(0);
  rect(textX+40, textY+240, textWidth("Hard"), textsize);
  fill(255);
  text("Hard", textX+40, textY+290);
}

void backButton() {
  fill(255,0,0);
  textSize(60);
  rect(5, (height-textsize)-10, textWidth("<-")+10, textsize);
  fill(255);
  text("<-", 10, (height-textsize)+10);
  if (mousePressed) {
    if (mouseX < (5 + textWidth("<-")+10) && mouseX > 5 && mouseY < ((height-textsize)-10 + textsize) && mouseY > (height-textsize)-10) {
      screen = 1;
      screen1 = 0;
    }
  }
}
