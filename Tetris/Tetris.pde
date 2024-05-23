/// Tetris 

int points;
int time;
int linesCleared;
  
void setup() {
  size(1500, 900);
  fill(255);
  rect(490, 10, 450, 880);
  fill(0);
  rect(500, 20, 430, 860);
  stroke(255);
  for (int i = 500; i <= 887; i = i + 43) {
    for (int j = 20; j <= 860; j = j + 43) {
      rect(i, j, 43, 43);
    }
  }
  // The code above created the grid drawing (+ border, vert & horiz lines)
  
}
