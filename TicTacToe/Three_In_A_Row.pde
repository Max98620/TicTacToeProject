int tally = 0;
int count= 0;

void CheckFor3() { 
  for(int x=0; x<rows; x++) {
    tally = 0;
    for(int y=0; y<cols; y++) {
      count = getspace(x+1, y+1).type;
    }
   if(count%2==0) {
        tally += 1;
      } else {
       tally-=1; 
      }
      if (tally == 3){
        Xscore +=1;
      } else if (tally == -3) {
        Oscore +=1;
      }
   println(tally);
 }
}
