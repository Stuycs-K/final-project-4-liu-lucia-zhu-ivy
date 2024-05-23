/// Tetris 

int points;
int time;
int linesCleared;
  
void setup() {
  size(1500, 900);
  rectBorder(450, 880, 490, 10);
  stroke(255);
  for (int i = 500; i <= 887; i = i + 43) {
    for (int j = 20; j <= 860; j = j + 43) {
      rect(i, j, 43, 43);
    }
  }
  // The code above created the grid drawing (+ border, vert & horiz lines)
  
  rectBorder(400, 100, 1000, 20);
  
}

// draws a white-bordered black rectangle (border width: 10 px)
void rectBorder(int w, int h, int x, int y) {
  stroke(0);
  fill(255);
  rect(x, y, w, h);
  fill(0);
  rect(x + 10, y + 10, w - 20, h - 20);
}
