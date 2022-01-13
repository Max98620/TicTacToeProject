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
    textSize(64);
      x += 10 * xdir;
  y += 10 * ydir;
  if (x + textWidth("el Poopso") > width || x < 0) {
    xdir *= -1;
  }
  if (y > height || y <0) {
    ydir*= -1;
  }
  fill(255,0,0);
  
  text("El poopso", x, y);
}

void mousePressed() {
  CheckFor3();
      println("Tally: " + tally);
    println("Score: " + Xscore);
}
