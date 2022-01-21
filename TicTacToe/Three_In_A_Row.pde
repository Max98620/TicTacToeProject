int tally = 0;
int posY= 0;
int posX=0;
int reset;

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
  for (int x= 0; x < 3; x++) {
    int tally = 0;
      int spaceType = spaces.get(x+4).type;
       if (spaceType == 2) {
         tally += 1;
       } else if (spaceType == 1) {
         tally -= 1;
       }
    
    if (tally == 3) {
      Xscore += 1;
      reset = 1;
    } else if (tally == -3) {
      Oscore += 1;
      reset = 1;
    }

  }
}
