/// Tetris 

int time;
boolean playing;
Grid g;


//=====CONTINUOUS FUNCTIONS======//

  
void setup() {
  size(1500, 900);
  g = new Grid();
  drawSigns();
  playing = false;
}

// PRESS P TO TOGGLE BTWN PLAYING AND PAUSE
// Q = QUIT and will clear the grid
void draw(){
  fill(255);
  textSize(30);
  text("Press 'p' to play or pause", 1050, 420);
  text("Press 'q' to quit", 1050, 460);
  textSize(40);
  text("Points:", 1100, 70);
  text("" + g.points, 1100, 130);
  text("Lines Cleared:", 1100, 250);
  text("" + g.linesCleared, 1100, 300);
  if (playing) {
    g.run();
  }
}

public void keyPressed(){
    if (key == 'p') {
      playing = !playing;
    }
    if (key == 'q') {
      playing = false;
      quit();
    }
    if(key == CODED){
      g.drawBlock(0);
      if(keyCode == UP){
        g.tetri.up();
      }
      if(keyCode == DOWN){
        g.tetri.down();
      }
      if(keyCode == LEFT && g.canShiftLeft()){
        g.tetri.left();
      }
      if(keyCode == RIGHT && g.canShiftRight()){
        g.tetri.right();
      }
      if(keyCode == 32){
        g.tetri.space();
      }
      g.drawBlock(g.findColor(g.tetri.c));
    }
  }
  
  
//=====HELPER FUNCTIONS=====//

void quit() {
  g.points = 0;
  g.linesCleared = 0;
  rectBorder(400, 150, 1000, 20);
  rectBorder(400, 150, 1000, 190);
  fill(0);
  stroke(255);
  for (int i = 530; i <= 917; i = i + 43) {
    for (int j = 20; j <= 860; j = j + 43) {
      rect(i, j, 43, 43);
    }
  }
}

void lose() {
  // will be implemented
}

void drawSigns() {
  rectBorder(450, 880, 520, 10); // grid border + grid lines
  stroke(255);
  for (int i = 530; i <= 917; i = i + 43) {
    for (int j = 20; j <= 860; j = j + 43) {
      rect(i, j, 43, 43);
    }
  }
  stroke(0);
  rectBorder(400, 150, 1000, 20); // top score sign
  rectBorder(400, 150, 1000, 190); // current score sign
  rectBorder(400, 150, 1000, 360); // time sign
  rectBorder(400, 150, 1000, 530); // lines cleared sign
  rectBorder(400, 150, 1000, 700); // current block speed sign
  // maybe I can fit another sign on the right 
  // by making all the other signs a little smaller.
  // this sign could display the title name "Tetrisand" 
  // and could also include instructions on how to play. 
  
  rectBorder(300, 300, 30, 20); // up-next block displayer
  rectBorder(150, 300, 350, 20); // displays whether you are in normal or sand mode
  rectBorder(400, 500, 30, 350); // displays how many of each block type has fallen
}
  

// draws a white-bordered black rectangle (border width: 10 px)
void rectBorder(int w, int h, int x, int y) {
  stroke(0);
  fill(255);
  rect(x, y, w, h);
  fill(0);
  rect(x + 10, y + 10, w - 20, h - 20);
}
