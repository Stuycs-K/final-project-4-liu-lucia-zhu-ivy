/// Tetris 

int time;
boolean playing;
Grid g;
int topScore = 0;

//=====CONTINUOUS FUNCTIONS======//

  
void setup() {
  size(1500, 900);
  drawSigns();
  g = new Grid();
  playing = false;
  drawTotalBlocks();
  drawTotal();
}

// PRESS P TO TOGGLE BTWN PLAYING AND PAUSE
// Q = QUIT and will clear the grid
void draw(){
  fill(255);
 // text("" + g.linesCleared, 1100, 300);
  if (playing) {
    g.run();
    drawTotal();
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
    if (playing){
      if (key == CODED || key == ' '){
        g.keyPressed();
      }
    }
  }
  
  
//=====HELPER FUNCTIONS=====//

void quit() {
  if (g.points > topScore){
    topScore = g.points;
  }
  setup();
}

void lose() {
  if (g.lose){
    quit();
  }
}

void drawSigns() {
  //rectBorder(450, 880, 520, 10); // grid border + grid lines
  //rectBorder(450, 794, 520, 96);
  rectBorder(450, 751, 520, 139);
  stroke(255);
  for (int i = 530; i <= 917; i = i + 43) {
    for (int j = 149; j <= 860; j = j + 43) {
      rect(i, j, 43, 43);
    }
  }
  stroke(0);
  rectBorder(400, 150, 1000, 20); // top score sign
  rectBorder(400, 150, 1000, 190); // current score sign
  rectBorder(400, 150, 1000, 360); // time sign
  rectBorder(400, 150, 1000, 530); // lines cleared sign
  // maybe I can fit another sign on the right 
  // by making all the other signs a little smaller.
  // this sign could display the title name "Tetrisand" 
  // and could also include instructions on how to play. 
  
  rectBorder(280, 250, 30, 20); // up-next block displayer
  //rectBorder(150, 300, 350, 20); // displays whether you are in normal or sand mode
  // no more sand :(
  rectBorder(400, 530, 30, 300); // displays how many of each block type has fallen
  textSize(30);
  fill(255);
  text("Press 'p' to play or pause", 1050, 420);
  text("Press 'q' to quit", 1050, 460);
  textSize(40);
  text("Points:", 1100, 70);
  text("Lines Cleared:", 1100, 250);
  text("Top Score: ", 1100, 590);
  text(topScore, 1100, 640);
  textSize(20);
  
  fill(255);
  text("Next Block", 100, 250);
  
  fill(0);
  textSize(100);
  text("TETRIS", 600, 100);
  textSize(40);
}
  

// draws a white-bordered black rectangle (border width: 10 px)
public void rectBorder(int w, int h, int x, int y) {
  stroke(0);
  fill(255);
  rect(x, y, w, h);
  fill(0);
  rect(x + 10, y + 10, w - 20, h - 20);
}

void drawTotalBlocks(){
  // left 
  Blocks I = new I();
  Blocks O = new O();
  Blocks T = new T();
  I.x = -11;
  I.y = 7;
  drawBlock(I);
  
  O.x = -11;
  O.y = 12;
  drawBlock(O);
  
  T.up();
  T.x = -11;
  T.y = 15;
  drawBlock(T);
  
  
  // right
  Blocks J = new J();
  Blocks L = new L();
  Blocks S = new S();
  Blocks Z = new Z();
  J.x = -8; 
  J.y = 7;
  drawBlock(J);
  
  L.x = -8;
  L.y = 10;
  drawBlock(L);
  
  S.x = -8;
  S.y = 13;
  drawBlock(S);
  
  Z.x = -8;
  Z.y = 16;
  drawBlock(Z);
  
}

void drawBlock(Blocks b){
  color c = g.findColor(b.c);
  for (int i = 0; i < b.block.length; i++){ // y
      for (int j = 0; j < b.block[0].length; j++){ // x
        if(b.block[i][j] == 1){
          float x = b.x+j;
          if (b.x < -10){
            x += 0;
          }else{
            x += 1.1;
          }
          float y = b.y+i;
          b.display(x, y, c);
        }
      }
  }
}

void drawTotal(){
  stroke(0);
  fill(0);
  rect(175, 400, 50, 400);
  rect(375, 350, 45, 450);
  fill(g.findColor(1));
  text(g.Icount, 175, 430);
  fill(g.findColor(4));
  text(g.Ocount, 175, 600);
  fill(g.findColor(6));
  text(g.Tcount, 175, 740);
  fill(g.findColor(2));
  text(g.Jcount, 375, 400);
  fill(g.findColor(3));
  text(g.Lcount, 375, 520);
  fill(g.findColor(5));
  text(g.Scount, 375, 650);
  fill(g.findColor(7));
  text(g.Zcount, 375, 770);
}
