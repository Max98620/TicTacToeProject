boolean WinOpportunity = false;
boolean LoseOpportunity = false;
int NextMove = 0;

void OpponentEasy() {
  int move = int(random(8));
  if (state%2 == 1) {
    if (spaces.get(int(move)).type == 0) {
      spaces.get(move).type = 1;
      state += 1;
    } else {
      move = int(random(8));
    }
  }
}

void CheckForTwoRow() {
  //Rows
  if (state%2 ==1) {
    for (int x= 0; x < 3; x++) {
      int tally = 0;
      for (int y= 0; y < 3; y++) {
        int spaceType = getspace(x, y).type;
        if (spaceType == 2) {
          tally += 1;
        } else if (spaceType == 1) {
          tally -= 1;
        }
        if ( tally > 1) {
          for ( y= 0; y < 3; y++) {
            spaceType = getspace(x, y).type;
            if (spaceType == 0) {
              spaces.get(x + (y *3)).type = 1;
              state+= 1;
            }
          }
        }
      }
    }
  }
}
void CheckForTwoRowO() {
  if (state%2 ==1) {
    for (int x= 0; x < 3; x++) {
      int tally = 0;
      for (int y= 0; y < 3; y++) {
        int spaceType = getspace(x, y).type;
        if (spaceType == 2) {
          tally += 1;
        } else if (spaceType == 1) {
          tally -= 1;
        }
        if ( tally < -1) {
          for ( y= 0; y < 3; y++) {
            spaceType = getspace(x, y).type;
            if (spaceType == 0) {
              spaces.get(x + (y *3)).type = 1;
              state+= 1;
            }
          }
        }
      }
    }
  }
}


void CheckForTwoCols() {
  if (state%2 ==1) {
    for (int y= 0; y < 3; y++) {
      int tally = 0;
      for (int x= 0; x < 3; x++) {
        int spaceType = getspace(x, y).type;
        if (spaceType == 2) {
          tally += 1;
        } else if (spaceType == 1) {
          tally -= 1;
        }
        if ( tally < -1) {
          for ( x= 0; x < 3; x++) {
            spaceType = getspace(x, y).type;
            if (spaceType == 0) {
              spaces.get(x + (y *3)).type = 1;
              state+= 1;
              println(tally);
            }
          }
        }
        //if ( tallyO > 1) {
        //  for ( x= 0; x < 3; x++) {
        //    spaceType = getspace(x, y).type;
        //    if (spaceType == 0) {
        //      spaces.get(x + (y *3)).type = 1;
        //      state+= 1;
        //    }
        //  }
        //}
      }
    }
  }
}
void CheckForTwoColsO() {
  if (state%2 ==1) {
    for (int y= 0; y < 3; y++) {
      int tally = 0;
      for (int x= 0; x < 3; x++) {
        int spaceType = getspace(x, y).type;
        if (spaceType == 2) {
          tally += 1;
        } else if (spaceType == 1) {
          tally -= 1;
        }
        if ( tally > 1) {
          for ( x= 0; x < 3; x++) {
            spaceType = getspace(x, y).type;
            if (spaceType == 0) {
              spaces.get(x + (y *3)).type = 1;
              state+= 1;
              println(tally);
            }
          }
        }
      }
    }
  }
}

void CheckForTwoDiag() {
  if (state%2 ==1) {
    if (spaces.get(0).type == 2 && spaces.get(4).type == 2) {
      if (spaces.get(8).type == 0) {
        spaces.get(8).type = 1;
        state += 1;
      }
    } 
    if (spaces.get(0).type == 2 && spaces.get(8).type == 2) {
      if (spaces.get(4).type == 0) {
        spaces.get(4).type = 1;
        state += 1;
      }
    } 
    if (spaces.get(4).type == 2 && spaces.get(8).type == 2) {
      if (spaces.get(0).type == 0) {
        spaces.get(0).type = 1;
        state += 1;
      }
    }
    if (spaces.get(6).type == 2 && spaces.get(4).type == 2) {
      if (spaces.get(2).type == 0) {
        spaces.get(2).type = 1;
        state += 1;
      }
    }
    if (spaces.get(6).type == 2 && spaces.get(2).type == 2) {
      if (spaces.get(4).type == 0) {
        spaces.get(4).type = 1;
        state += 1;
      }
    }
    if (spaces.get(4).type == 2 && spaces.get(2).type == 2) {
      if (spaces.get(6).type == 0) {
        spaces.get(6).type = 1;
        state += 1;
      }
    }
    //
    if (spaces.get(0).type == 1 && spaces.get(4).type == 1) {
      if (spaces.get(8).type == 0) {
        spaces.get(8).type = 1;
        state += 1;
      }
    } 
    if (spaces.get(0).type == 1 && spaces.get(8).type == 1) {
      if (spaces.get(4).type == 0) {
        spaces.get(4).type = 1;
        state += 1;
      }
    } 
    if (spaces.get(4).type == 1 && spaces.get(8).type == 1) {
      if (spaces.get(0).type == 0) {
        spaces.get(0).type = 1;
        state += 1;
      }
    }
    if (spaces.get(6).type == 1 && spaces.get(4).type == 1) {
      if (spaces.get(2).type == 0) {
        spaces.get(2).type = 1;
        state += 1;
      }
    }
    if (spaces.get(6).type == 1 && spaces.get(2).type == 1) {
      if (spaces.get(4).type == 0) {
        spaces.get(4).type = 1;
        state += 1;
      }
    }
    if (spaces.get(4).type == 1 && spaces.get(2).type == 1) {
      if (spaces.get(6).type == 0) {
        spaces.get(6).type = 1;
        state += 1;
      }
    }
  }
}



void OpponentHard() {
  IntList Corners = new IntList();
  IntList Sides = new IntList();

  Corners.append(0);
  Corners.append(2);
  Corners.append(6);
  Corners.append(8);

  Sides.append(1);
  Sides.append(3);
  Sides.append(5);
  Sides.append(7);

  int randSide = Sides.get(int(random(4)));
  int randCorner = Corners.get(int(random(4)));


  if (state%2 ==1) {
    CheckForTwoRowO();
    CheckForTwoColsO();
  }
  if (state%2 ==1) {
    CheckForTwoRow();
    CheckForTwoCols();
    CheckForTwoDiag();
  }
  if (state==1) {
    if (spaces.get(4).type == 0) {
      spaces.get(4).type = 1;
      state += 1;
    } else if (spaces.get(randCorner).type == 0) {
      spaces.get(randCorner).type = 1;
      state += 1;
    } else {
      randCorner = Corners.get(int(random(4)));
    }
  }
  if (state == 3) {
    if (spaces.get(4).type == 1) {
      if (spaces.get(randSide).type == 0) {
        spaces.get(randSide).type = 1;
        state += 1;
      } else {
        randSide = Sides.get(int(random(4)));
      }
    } else if (spaces.get(randCorner).type == 0) {
      spaces.get(randCorner).type = 1;
      state += 1;
    } else {
      randCorner = Corners.get(int(random(4)));
    }
  }
  if (state > 3 && state%2 == 1) {
    if (spaces.get(randSide).type == 0) {
      spaces.get(randSide).type = 1;
      state += 1;
    } else if (spaces.get(randCorner).type == 0) {
      spaces.get(randCorner).type = 1;
      state += 1;
    } else {
      randCorner = Corners.get(int(random(4)));
      randSide = Sides.get(int(random(4)));
    }
  }
  CheckFor3();
}
