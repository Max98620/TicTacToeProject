void OpponentEasy() {
  if (state%2 == 1) {
    int space = ceil(random(8));
    if (spaces.get(space).type > 0) {
      space = ceil(random(8));
    } else {
      spaces.get(space).type = 1;
    }
    state += 1;
  }
}

void OpponentHard(){
  
}
