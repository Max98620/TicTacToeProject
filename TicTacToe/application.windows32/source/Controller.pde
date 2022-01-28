int screen1 = 0;
int s = 4*60;
void Switcher(){
  switch(screen){
   case 0: 
     buttonSetup();
     background(0);
     startMenu();
     if (mousePressed) {
       if (mouseX < (textX + titleWidth) && mouseX > textX && mouseY < (textY + textsize) && mouseY > textY) {
           screen = 1;
           screen1 = 2;
       } else if (mouseX < (textX + textWidth(SinglePlayer)) && mouseX > textX && mouseY < (textY + 80 + textsize) && mouseY > textY + 80) {
           screen = 3;
       }
     }
     break;
   case 1:
     s -= 1;
     background(0);
     text(ceil(s/60), width/2, height/2);
     if (s < 1){
       screen = screen1;
     }
     state = 0;
   break;
   case 2:
   //MultiPlayer
     for (int i=0; i < spaces.size(); i++){
      spaces.get(i).click();
      spaces.get(i).createSpace();
     }
     fill(0);
     rect(0,600, width, 200); 
     textDraw(scoreboard, Font, height, textColour, LEFT, CENTER, 0, GUIheight, GUIwidth, GUIsize);
     Board = (str(Xscore) + "-" + str(Oscore));
     GetTurn();

     resetButton();
     scoreBoard();
     if (tally == 3) {
        Xscore += 1;
        reset = 1;
      } else if (tally == -3) {
        Oscore += 1;
        reset = 1;
      }
  
    
    if (reset == 1){
      screen = 1;
      s = 4*60;
      for (int i = 0; i < spaces.size(); i++){
        spaces.get(i).type = 0;
      }
      reset = 0;
    }
   break;
   case 3:
     //Difficulty Select
     Easy();
     Hard();
     if (mousePressed) {
       if (mouseX < (textX+40 + titleWidth) && mouseX > textX+40 && mouseY < (textY+160 + textsize) && mouseY > textY+160) {
           screen = 1;
           s = 4*60;
           screen1 = 4;
       } else if (mouseX < ((textX+40) + textWidth("Hard")) && mouseX > textX+40 && mouseY < (textY+240 + textsize) && mouseY > textY+240) {
           screen = 1;
           s = 4*60;
           screen1 = 5;
       }
     }
   break;
   case 4:
      //SinglePlayer
     for (int i=0; i < spaces.size(); i++){
      spaces.get(i).click();
      spaces.get(i).createSpace();
     }
     fill(0);
     rect(0,600, width, 200); 
     textDraw(scoreboard, Font, height, textColour, LEFT, CENTER, 0, GUIheight, GUIwidth, GUIsize);
     Board = (str(Xscore) + "-" + str(Oscore));
     GetTurn();

     resetButton();
     scoreBoard();
     OpponentEasy();
     if (reset == 1){
      screen = 1;
      s = 4*60;
      for (int i = 0; i < spaces.size(); i++){
        spaces.get(i).type = 0;
      }
      reset = 0;
    }
   break;
   case 5:
     for (int i=0; i < spaces.size(); i++){
      spaces.get(i).click();
      spaces.get(i).createSpace();
     }
     fill(0);
     rect(0,600, width, 200); 
     textDraw(scoreboard, Font, height, textColour, LEFT, CENTER, 0, GUIheight, GUIwidth, GUIsize);
     Board = (str(Xscore) + "-" + str(Oscore));
     GetTurn();
     resetButton();
     scoreBoard();
     if (reset == 1){
      screen = 1;
      s = 4*60;
      for (int i = 0; i < spaces.size(); i++){
        spaces.get(i).type = 0;
      }
      reset = 0;
    }
   break;
  }
}
