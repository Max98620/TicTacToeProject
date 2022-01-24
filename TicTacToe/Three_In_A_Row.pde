int tally = 0;
int posY= 0;
int posX=0;
int reset;
int tie = 0;

void CheckFor3() { 
  for (int x= 0; x < 3; x++) {
    int tally = 0;
    for (int y= 0; y < 3; y++) {
      int spaceType = getspace(x,y).type;
       if (spaceType == 2) {
         tally += 1;
       } else if (spaceType == 1) {
         tally -= 1;
       }
    }
    if (tally == 3) {
      Xscore += 1;
      reset = 1;
    } else if (tally == -3) {
      Oscore += 1;
      reset = 1;
    }

  }
  
   for (int y= 0; y < 3; y++) {
    int tally = 0;
    for (int x= 0; x < 3; x++) {
      int spaceType = getspace(x,y).type;
       if (spaceType == 2) {
         tally += 1;
       } else if (spaceType == 1) {
         tally -= 1;
       }
    }
    if (tally == 3) {
      Xscore += 1;
      reset = 1;
    } else if (tally == -3) {
      Oscore += 1;
      reset = 1;
    }

  }

      
  if (spaces.get(0).type == 2 && spaces.get(4).type == 2 && spaces.get(8).type == 2){
    reset = 1;
    Xscore += 1;
  } else if (spaces.get(0).type == 1 && spaces.get(4).type == 1 && spaces.get(8).type == 1) {
    Oscore += 1;
    reset = 1;
  }
  
  if (spaces.get(2).type == 2 && spaces.get(4).type == 2 && spaces.get(6).type == 2){
    reset = 1;
    Xscore += 1;
  } else if (spaces.get(2).type == 1 && spaces.get(4).type == 1 && spaces.get(6).type == 1) {
    Oscore += 1;
    reset = 1;
  }
}
