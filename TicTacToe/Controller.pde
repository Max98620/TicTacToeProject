int screene = 0;
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
           screene = 2;
       }
     }
     break;
   case 1:
     s -= 1;
     background(0);
     text(ceil(s/60), width/2, height/2);
     if (s < 1){
       screen = screene;
     }
     break;
   case 2:
   //SinglePlayer
     for (int i=0; i < spaces.size(); i++){
      spaces.get(i).click();
      spaces.get(i).createSpace();
     }
     fill(0);
     rect(0,600, width, 200); 
     textDraw(scoreboard, Font, height, textColour, LEFT, CENTER, 0, GUIheight, GUIwidth, GUIsize);
     break;
  }
}
