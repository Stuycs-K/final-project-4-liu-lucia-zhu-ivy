/// Tetris 

int points;
int time;
int linesCleared;
<<<<<<< HEAD
Grid grid;
=======
Grid g;
>>>>>>> f6548547ac630e4e1accd9b11c1381663996a64d
  
void setup() {
  grid = new Grid();
  size(1500, 900);
  rectBorder(450, 880, 520, 10);
  stroke(255);
  for (int i = 530; i <= 917; i = i + 43) {
    for (int j = 20; j <= 860; j = j + 43) {
      rect(i, j, 43, 43);
    }
  }
  // The code above created the grid drawing (+ border, vert & horiz lines)
  
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
<<<<<<< HEAD
 
  grid.spawnBlocks();
=======
  
  g = new Grid();
>>>>>>> f6548547ac630e4e1accd9b11c1381663996a64d
}

// draws a white-bordered black rectangle (border width: 10 px)
void rectBorder(int w, int h, int x, int y) {
  stroke(0);
  fill(255);
  rect(x, y, w, h);
  fill(0);
  rect(x + 10, y + 10, w - 20, h - 20);
}

<<<<<<< HEAD
void draw() {
  grid.run();
  grid.display();
}
  
=======
void draw(){
  g.run();
}
>>>>>>> f6548547ac630e4e1accd9b11c1381663996a64d
