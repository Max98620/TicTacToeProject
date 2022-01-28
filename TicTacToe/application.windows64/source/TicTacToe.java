import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class TicTacToe extends PApplet {

int screen = 0;
public void setup() {
  
  stroke(0,150,200);
  strokeWeight(5);
  textSetup();
  BoxSetup();
}

public void draw() {
    Switcher();
}
//create a click function
public void mousePressed(){
}
int screen1 = 0;
int s = 4*60;
public void Switcher(){
  switch(screen){
   case 0: 
     buttonSetup();
     background(0);
     startMenu();
     if (mousePressed) {
       if (mouseX < (textX + titleWidth) && mouseX > textX && mouseY < (textY + textsize) && mouseY > textY) {
           screen = 1;
           screen1 = 2;
       } else if (mouseX < (textX + textWidth(SinglePlayer)) && mouseX > textX && mouseY < (textY + 80 + textsize) && mouseY > textY + 80) {
           screen = 3;
       }
     }
     break;
   case 1:
     s -= 1;
     background(0);
     text(ceil(s/60), width/2, height/2);
     if (s < 1){
       screen = screen1;
     }
     state = 0;
   break;
   case 2:
   //MultiPlayer
     for (int i=0; i < spaces.size(); i++){
      spaces.get(i).click();
      spaces.get(i).createSpace();
     }
     fill(0);
     rect(0,600, width, 200); 
     textDraw(scoreboard, Font, height, textColour, LEFT, CENTER, 0, GUIheight, GUIwidth, GUIsize);
     Board = (str(Xscore) + "-" + str(Oscore));
     GetTurn();

     resetButton();
     scoreBoard();
     if (tally == 3) {
        Xscore += 1;
        reset = 1;
      } else if (tally == -3) {
        Oscore += 1;
        reset = 1;
      }
  
    
    if (reset == 1){
      screen = 1;
      s = 4*60;
      for (int i = 0; i < spaces.size(); i++){
        spaces.get(i).type = 0;
      }
      reset = 0;
    }
   break;
   case 3:
     //Difficulty Select
     Easy();
     Hard();
     if (mousePressed) {
       if (mouseX < (textX+40 + titleWidth) && mouseX > textX+40 && mouseY < (textY+160 + textsize) && mouseY > textY+160) {
           screen = 1;
           s = 4*60;
           screen1 = 4;
       } else if (mouseX < ((textX+40) + textWidth("Hard")) && mouseX > textX+40 && mouseY < (textY+240 + textsize) && mouseY > textY+240) {
           screen = 1;
           s = 4*60;
           screen1 = 5;
       }
     }
   break;
   case 4:
      //SinglePlayer
     for (int i=0; i < spaces.size(); i++){
      spaces.get(i).click();
      spaces.get(i).createSpace();
     }
     fill(0);
     rect(0,600, width, 200); 
     textDraw(scoreboard, Font, height, textColour, LEFT, CENTER, 0, GUIheight, GUIwidth, GUIsize);
     Board = (str(Xscore) + "-" + str(Oscore));
     GetTurn();

     resetButton();
     scoreBoard();
     OpponentEasy();
     if (reset == 1){
      screen = 1;
      s = 4*60;
      for (int i = 0; i < spaces.size(); i++){
        spaces.get(i).type = 0;
      }
      reset = 0;
    }
   break;
   case 5:
     for (int i=0; i < spaces.size(); i++){
      spaces.get(i).click();
      spaces.get(i).createSpace();
     }
     fill(0);
     rect(0,600, width, 200); 
     textDraw(scoreboard, Font, height, textColour, LEFT, CENTER, 0, GUIheight, GUIwidth, GUIsize);
     Board = (str(Xscore) + "-" + str(Oscore));
     GetTurn();
     resetButton();
     scoreBoard();
     if (reset == 1){
      screen = 1;
      s = 4*60;
      for (int i = 0; i < spaces.size(); i++){
        spaces.get(i).type = 0;
      }
      reset = 0;
    }
   break;
  }
}
ArrayList<Spaces> spaces = new ArrayList<Spaces>();
int cols = 3, rows = 3;
int state;
int GUIsize = 200;
int GUIwidth = width;
int Xscore = 0, Oscore= 0;
int textColour = color(0);
int GUIheight = 600;
int LineDetect;

public void BoxSetup() {
  for (int x = 0; x < cols; x++) {
   for (int y = 0; y < rows; y++) {
     spaces.add(new Spaces(width*x/cols, (height-GUIsize)*y/rows,width/cols, (height-GUIsize)/rows));
   }
  }
}

class Spaces {
  int c = color(0,200,255);
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
  public boolean boxDetect(int MouseX, int MouseY, int BoxX, int BoxY, int BoxWidth, int BoxHeight) {
   return(MouseX < (BoxX + BoxWidth) && MouseX > BoxX && MouseY < (BoxY + BoxHeight) && MouseY > BoxY);
  }
  public void createSpace() {
    fill(c);
    rect(this.x,this.y,this.Width,this.Height);
    if (type == 1){
      ellipse(this.x+(this.Width/2), this.y+(Height/2), Width, Height);
    } else if (type == 2) {
     createX();
    }
  }
  

  
  public void click() {
    if (boxDetect(mouseX, mouseY, this.x, this.y, this.Width, this.Height)) {
      if (mousePressed) {
        if (type == 0) {
          state +=1;
          if (state%2 == 0){
            type = 1;
            CheckFor3();
            OpponentHard();
            
          } else {
             type = 2; 
             CheckFor3();
             OpponentHard();
          }
          
        }
      }
    }
    }
  
  public void createX() {
    line(this.x, this.y, this.x +this.Width, this.y + this.Height);
    line(this.x + this.Width, this.y, this.x, this.y+this.Height);
  }
  
}
 public Spaces getspace (int x, int y){
   return spaces.get((x) + (y*3)); 
 }
 
 
boolean WinOpportunity = false;
boolean LoseOpportunity = false;
int NextMove = 0;

public void OpponentEasy() {
  int move = PApplet.parseInt(random(8));
  if (state%2 == 1) {
    if (spaces.get(PApplet.parseInt(move)).type == 0) {
      spaces.get(move).type = 1;
      state += 1;
    } else {
      move = PApplet.parseInt(random(8));
    }
  }
}

public void CheckForTwoRow() {
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
public void CheckForTwoRowO() {
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


public void CheckForTwoCols() {
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
public void CheckForTwoColsO() {
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

public void CheckForTwoDiag() {
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



public void OpponentHard() {
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

  int randSide = Sides.get(PApplet.parseInt(random(4)));
  int randCorner = Corners.get(PApplet.parseInt(random(4)));


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
      randCorner = Corners.get(PApplet.parseInt(random(4)));
    }
  }
  if (state == 3) {
    if (spaces.get(4).type == 1) {
      if (spaces.get(randSide).type == 0) {
        spaces.get(randSide).type = 1;
        state += 1;
      } else {
        randSide = Sides.get(PApplet.parseInt(random(4)));
      }
    } else if (spaces.get(randCorner).type == 0) {
      spaces.get(randCorner).type = 1;
      state += 1;
    } else {
      randCorner = Corners.get(PApplet.parseInt(random(4)));
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
      randCorner = Corners.get(PApplet.parseInt(random(4)));
      randSide = Sides.get(PApplet.parseInt(random(4)));
    }
  }
  CheckFor3();
}
//Global variables
int textsize = 60;
String SinglePlayer = "Single Player";
String MultiPlayer = "MultiPlayer";
int textX = 10, textY = 50;
int ScoreX = 225, ScoreY = 675;
String Board = (str(Xscore) + "-" + str(Oscore));
int EasyX = width/3;
int EasyY = (height/2 + 50);
String turn;

public void GetTurn() {
  if (state%2 == 0) {
    turn = "X";
  } else {
    turn = "O";
  }
}

public void buttonSetup() {
  textSize(textsize);
  
}

public void startMenu() {
  fill(0);
  rect(textX, textY, textWidth(MultiPlayer), textsize);
  fill(255);
  text(MultiPlayer, textX, textY+50);
  
  fill(0);
  rect(textX, textY + 80, textWidth(SinglePlayer), textsize);
  fill(255);
  text(SinglePlayer, textX, textY+130);
}

public void scoreBoard() {
  text(Board,50, ScoreY);
  textSize(60);
  text(turn + "'s Turn", width - 300, ScoreY);
}

public void resetButton() {
  fill(255,0,0);
  textSize(60);
  rect(width/3, (height-textsize)-10, textWidth("Reset")+10, textsize);
  fill(255);
  text("Reset", (width/3)+5, (height-textsize)+10);
  if (mousePressed) {
    if (mouseX < (width/3 + textWidth("Reset")+10) && mouseX > width/3 && mouseY < ((height-textsize)-10 + textsize) && mouseY > (height-textsize)-10) {
      reset = 1;
    }
  }
}

public void Easy() {
  //Easy
  fill(0);
  rect(textX+40, textY+160, textWidth("Easy"), textsize);
  fill(255);
  text("Easy", textX+40, textY+210);
}
public void Hard(){

  //Hard
  fill(0);
  rect(textX+40, textY+240, textWidth("Hard"), textsize);
  fill(255);
  text("Hard", textX+40, textY+290);
}

public void backButton() {
  fill(255,0,0);
  textSize(60);
  rect(5, (height-textsize)-10, textWidth("<-")+10, textsize);
  fill(255);
  text("<-", 10, (height-textsize)+10);
  if (mousePressed) {
    if (mouseX < (5 + textWidth("<-")+10) && mouseX > 5 && mouseY < ((height-textsize)-10 + textsize) && mouseY > (height-textsize)-10) {
      screen = 1;
      screen1 = 0;
    }
  }
}
PFont Font;
float titleWidth, titleHeight;
String quit;
String scoreboard;

public void textSetup() {
  Font = createFont ("Cambria", height); 
  scoreboard = PApplet.parseChar(Xscore) + " - " + PApplet.parseChar(Oscore);
  titleWidth = width * 1/2;
  titleHeight = height * 1/10;
  quit = "X";

 
}

public void textDraw(String string, PFont font, float height, int ink, int alignHorizontal, int alignVertical, int rectX, int rectY, int rectWidth, int rectHeight) {
  float fontSize = height;
  fill(ink); 
  textAlign (alignHorizontal, alignVertical); 
  if (string.length() >= 3) {
    fontSize = textCalculator(height, string, rectWidth);
  } 
  else {
    fontSize = fontSize * 0.08f;
  }
  textFont(font, fontSize);
  text(string, rectX, rectY, rectWidth, rectHeight); 
  fill(255); 
}

public float textCalculator(float size, String string, float rectWidth) {
  textSize(size);
  while ( textWidth(string) > rectWidth ) {
    size = size * 0.99f;
    textSize(size);
  }
  return size; 
}
int tally = 0;
int tallyO = 0;
int posY= 0;
int posX=0;
int reset;
int tie = 0;

public void CheckFor3() { 
  //Check Rows
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
  //Check Cols
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
  
  if (state == 9) {
    reset = 1;
  }
}
  public void settings() {  size(600,800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "TicTacToe" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
