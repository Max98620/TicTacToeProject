int x,y;
int xdir = 2;
int ydir = -1;
int screen = 0;
void setup() {
  size(600,800);
  stroke(0,150,200);
  strokeWeight(5);
  textSetup();
  BoxSetup();
}

void draw() {
    Switcher();
}

void mousePressed() {
  CheckFor3();
    println("X's Score: " + Xscore);
    println("O's Score: " + Oscore);
}
