ArrayList<Spaces> spaces = new ArrayList<Spaces>();
int cols = 3, rows = 3;
int state;
void setup() {
  size(600,800);
  stroke(0,150,200);
  strokeWeight(5);
  textSetup();
  
  for (int x = 0; x < cols; x++) {
   for (int y = 0; y < rows; y++) {
     spaces.add(new Spaces(width*x/cols, (height-GUIsize)*y/rows,width/cols, (height-GUIsize)/rows));
   }
  }
}

void draw() {
  for (int i=0; i < spaces.size(); i++){
    spaces.get(i).click();
    spaces.get(i).createSpace();
  }
  fill(0);
  rect(0,(spaces.get(8).y+spaces.get(8).Height),width, GUIsize); 
  textDraw(scoreboard, Font, height, textColour, LEFT, CENTER, 0, GUIheight, GUIwidth, GUIsize);
}
  
void mousePressed() {
 
}
class Spaces {
  color c = color(0,200,255);
  boolean isOccupied;
  int x;
  int y;
  int Width;
  int Height;
  int type = 0;
  Spaces(int x, int y, int Width, int Height) {
    this.x = x;
    this.y = y;
    this.Width = Width;
    this.Height = Height;
  }
  boolean boxDetect(int MouseX, int MouseY, int BoxX, int BoxY, int BoxWidth, int BoxHeight) {
   return(MouseX < (BoxX + BoxWidth) && MouseX > BoxX && MouseY < (BoxY + BoxHeight) && MouseY > BoxY);
  }
  void createSpace() {
    fill(c);
    rect(this.x,this.y,this.Width,this.Height);
    if (type == 1){
      ellipse(this.x+(this.Width/2), this.y+(Height/2), Width, Height);
    } else if (type == 2) {
     createX();
    }
  }
  void click() {
    if (boxDetect(mouseX, mouseY, this.x, this.y, this.Width, this.Height)) {
      if (mousePressed) {
        if (type == 0) {
          state +=1;
          if (state%2 == 0){
            type = 1;
          } else {
             type = 2; 
          }
        }
      }
    }
  }
  void createX() {
    line(this.x, this.y, this.x +this.Width, this.y + this.Height);
    line(this.x + this.Width, this.y, this.x, this.y+this.Height);
  }
  
}
