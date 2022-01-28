PFont Font;
float titleWidth, titleHeight;
String quit;
String scoreboard;

void textSetup() {
  Font = createFont ("Cambria", height); 
  scoreboard = char(Xscore) + " - " + char(Oscore);
  titleWidth = width * 1/2;
  titleHeight = height * 1/10;
  quit = "X";

 
}

void textDraw(String string, PFont font, float height, color ink, int alignHorizontal, int alignVertical, int rectX, int rectY, int rectWidth, int rectHeight) {
  float fontSize = height;
  fill(ink); 
  textAlign (alignHorizontal, alignVertical); 
  if (string.length() >= 3) {
    fontSize = textCalculator(height, string, rectWidth);
  } 
  else {
    fontSize = fontSize * 0.08;
  }
  textFont(font, fontSize);
  text(string, rectX, rectY, rectWidth, rectHeight); 
  fill(255); 
}

float textCalculator(float size, String string, float rectWidth) {
  textSize(size);
  while ( textWidth(string) > rectWidth ) {
    size = size * 0.99;
    textSize(size);
  }
  return size; 
}
