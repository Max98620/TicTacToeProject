void CheckFor3() { 
  
 int i =0;
  for(int x=0; x<rows; x++) {
    i= 0;
    for(int y=0; y<cols; y++) {
      if (spaces.get(y).type == 2) {
        i += 1;
        println(i);
      } else if (spaces.get(y).type == 1){
        i -= 1;
        println(i);
      }
    } 
  }
   if (i == 3){
    Xscore += 1;
  } else if (i == -3){
    Oscore-=1;
  }
}
