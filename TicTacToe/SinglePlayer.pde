void OpponentEasy() {
  int move = int(random(8));
  if (state%2 == 1) {
    if (spaces.get(int(move)).type == 0){
      spaces.get(move).type = 1;
      state += 1;
    } else {
      move = int(random(8));
    }
  }
}
