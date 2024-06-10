import java.util.*;
import java.io.*;

public class Grid {
  ArrayList<int[]> grid;
  ArrayList<String> toSpawn;
  ArrayList<Integer> rowSum; // indicates whether a row is full or not and should be cleared
  Blocks tetri;
  //public boolean stop; // indicates when block has reached bottom or another block
  int points;
  int linesCleared;
  int[] lowest = new int[10];
  boolean lose = false;
  boolean shouldDraw = true;
  Blocks next;
  int nextX, nextY;
  int Icount = 0, Jcount = 0, Lcount = 0, Ocount = 0, Scount = 0, Tcount = 0, Zcount = 0;
  boolean isLost = false;


  // creates an grid representing the playable grid
  public Grid() { 
    grid = new ArrayList<int[]>();
    rowSum = new ArrayList<Integer>();
    for (int i = 0; i < 20; i++) {
      grid.add(new int[10]);
      rowSum.add(0);
    }
    points = 0;
    linesCleared = 0;
    // this is so that every block gets used once before there are duplicates
    toSpawn = new ArrayList<String>();
    String[] types = new String[] {"I", "J", "L", "O", "S", "T", "Z"};
    for (String s : types){
      toSpawn.add(s);
    }
    tetri = spawnNew();
    //tetri = new J();
    next = spawnNew();
 //   next.isNext = true;
    displayNext(next.c);
  }
  
  // refills the bag (toSpawn) of possible "next" blocks
  void refill() {
    String[] types = new String[] {"I", "J", "L", "O", "S", "T", "Z"};
    for (int i = 0; i < 7; i++) { 
      for (int j = 0; j < 2; j++) {
        toSpawn.add(types[i]);
      }
    }
  }
  
  // randomly chooses and spawns a block from toSpawn
  Blocks spawnNew() {
    if (toSpawn.size() == 0) {
      refill();
    }
   String type = toSpawn.remove((int)(Math.random() * toSpawn.size()));
   if (type.equals("I")) { return new I(); }
   if (type.equals("J")) { return new J(); }
   if (type.equals("L")) { return new L(); }
   if (type.equals("O")) { return new O(); }
   if (type.equals("S")) { return new S(); }
   if (type.equals("T")) { return new T(); }
   if (type.equals("Z")) { return new Z(); }
   else {
     return new O(); // won't reach here but won't compile otherwise
   }
  }
  

public void run(){
  if (isLost) {
     lose();
  }
  else {
    updateScore();
    if (shouldStop()) {
      if (tetri.lowest_y <= 2) {
        isLost = true;
        lose();
      }
      else {
        //delay(700);
        tetri.lowest_y--;
        tetri.y--;
        tetri.drawBlock(findColor(tetri.c));
        incrementBlockCount();
        if (clearLine(inputBlock())) {
          delay(300);
        }
        displayNext(0);
        //next.drawBlock(0);
        tetri = next;
        tetri.x = nextX;
        tetri.y = nextY;
        next = spawnNew();
       // next.isNext = true;
        displayNext(next.c);
      }
    }
    else {
      changeShouldDraw();
      if (tetri.b_time < millis() + 10 && tetri.lowest_y < 19 && shouldDraw) {
        tetri.drawBlock(0);
      }
      tetri.fall();
      if (shouldDraw) {
        tetri.drawBlock(findColor(tetri.c));
      }
    }
  }
}

public void incrementBlockCount() {
  String s = tetri.type;
  if (s.equals("I")) {
    Icount++;
  }
  if (s.equals("J")) {
    Jcount++;
  }
  if (s.equals("L")) {
    Lcount++;
  }
  if (s.equals("O")) {
    Ocount++;
  }
  if (s.equals("S")) {
    Scount++;
  }
  if (s.equals("T")) {
    Tcount++;
  }
  if (s.equals("Z")) {
    Zcount++;
  }
}

// correlates tetri.c back to an actual color
// I: turquoise; J: blue; L: orange; O: yellow; S: green; T: purple; Z: red
// I chose colors according to Tetris Wiki
public color findColor(int c) {
  if (c == 1) { return color(48, 213, 200); }
  if (c == 2) { return color(0, 0, 255); }
  if (c == 3) { return color(255, 165, 0); }
  if (c == 4) { return color(255, 255, 0); }
  if (c == 5) { return color(170, 255, 0); }
  if (c == 6) { return color(191, 64, 191); }
  if (c == 7) { return color(255, 0, 0); }
  else { return color(0); }
}

// stops block from moving left if there's 
// a block to the left of it
 public boolean canShiftLeft() {
   boolean ans = true;
    for (int i = 0; i < tetri.block.length; i++) {
      int ii = tetri.y + i;
      int j = 0;
      while (tetri.block[i][j] == 0) {
        j++;
      }
      if (j + tetri.x - 1 >= 0 && 
      grid.get(19 - ii)[j + tetri.x - 1] != 0) {
        ans = false;
      }
    }
    return ans;
  }
  
  // canShiftLeft() but it's right
  public boolean canShiftRight() {
    boolean ans = true;
    for (int i = 0; i < tetri.block.length; i++) {
      int ii = tetri.y + i;
      int j = tetri.block[0].length - 1;
      while (tetri.block[i][j] == 0) {
        j--;
      }
      if (j + tetri.x + 1 <= 9 &&
      grid.get(19 - ii)[j + tetri.x + 1] != 0) {
        ans = false;
      }
    }
    return ans;
  }

// if lowest_y reaches the bottom,
// or the block is on top of another block,
// this returns true
public boolean shouldStop() {  
  if (tetri.lowest_y >= 20) {
    return true;
  }
  boolean ans = false;
      for (int j = 0; j < tetri.block[0].length; j++){
      int iy = tetri.block.length - 1;
      int ix = tetri.x+j;
      while (tetri.block[iy][j] == 0) {
        iy--;
      }
      iy += tetri.y;
        if(grid.get(19 - iy)[ix] != 0){
          ans = true;
        }
      }
      return ans;     
  }
  
public void changeShouldDraw() {
  if (tetri.lowest_y >= 19) {
    shouldDraw = false;
  }
  else {
    boolean ans = true;
    for (int j = 0; j < tetri.block[0].length; j++){
    int iy = tetri.block.length - 1;
    int ix = tetri.x+j;
    while (tetri.block[iy][j] == 0) {
      iy--;
    }
    iy++;
    iy += tetri.y;
      if(grid.get(19 - iy)[ix] != 0){
        ans = false;
      }
    }
    shouldDraw = ans;
  }
}



// once the block has stopped, the block's color values
// are inputted into the grid so the grid can 
// remember the block's position
// returns an ArrayList of rows that can be cleared after 
// the block is inputted, if any
public ArrayList<Integer> inputBlock() {
  ArrayList<Integer> ans = new ArrayList<Integer>();
  for (int i = 0; i < tetri.block.length; i++){
      for (int j = 0; j < tetri.block[0].length; j++){
        if(tetri.block[i][j] == 1){
          int x = tetri.x+j;
          int y = tetri.y+i;
          if (y <= 1) {
            isLost = true;
          }
          if (!isLost) {
            grid.get(19 - y)[x] = tetri.c;
            rowSum.set(19 - y, rowSum.get(19 - y) + 1);
            if (rowSum.get(19 - y) == 10) {
              ans.add(19 - y);
            }
          }
        }
      }
  }
  return ans;
}

void lose() {
  rectBorder(450, 751, 520, 139);
  fill(255);
  stroke(255);
  textSize(50);
  text("GAME OVER", 600, 500);
  textSize(20);
  text("Press 'q' and then 'p' to play again!", 600, 550);
  textSize(40);
}

// clears rows if there are rows to be cleared and then returns true
// otherwise, returns false
// I changed grid's indexing so that (0, 0) is at the 
// bottom left corner instead of the top right corner.
// This is so that when I delete a row, the rows on top of that row
// fall downwards, instead of the rows below that row falling upwards
public boolean clearLine(ArrayList<Integer> rows) {
  if (rows.size() > 0) {
  int n = rows.size();
  int low = rows.get(n - 1);
  for (int i = 0; i < 10 ; i++){
    lowest[i] -= n;
  }
  // point system
    if (n == 1) {
      points += 100;
    }
    if (n == 2) {
      points += 300;
    }
    if (n == 3) {
      points += 500;
    }
    if (n == 4) {
      points += 1200;
    }
  while (n > 0) {
    int deleted = rows.remove(0);
    grid.remove(deleted);
    grid.add(new int[10]);
    rowSum.remove(deleted);
    rowSum.add(0);
    linesCleared++;
    n--;
  }
  tetri.speedUp(linesCleared/5 + 1);
  for (int i = low; i < 20; i++) { 
    for (int j = 0; j < 10; j++) { 
      tetri.display(j, 19 - i, findColor(grid.get(i)[j]));
    }
  }
  updateScore();
  return true;
}
return false;
}

public void keyPressed(){
  changeShouldDraw();
  if(key == CODED){
    if(keyCode == DOWN){
      if (shouldDraw) {
        tetri.drawBlock(0);
        points++;
        tetri.down();
        updateScore();
        tetri.drawBlock(findColor(tetri.c));
       }
      }
      else {
        tetri.drawBlock(0);
        if(keyCode == UP){
          int prevX = tetri.x;
          int prevY = tetri.y;
          int lowestPrevY = tetri.lowest_y;
          tetri.up();
          if (!isValid()) {
            tetri.x--;
            if (!isValid()) {
              tetri.x += 2;
              if (!isValid()) {
                tetri.x--;
                tetri.y--; 
                tetri.lowest_y--;
                if (!isValid()) {
                  tetri.y--;
                  tetri.lowest_y--;
                  if (!isValid()) {
                    tetri.y--;
                    tetri.lowest_y--;
                    if (!isValid()) {
                      tetri.up();
                      tetri.x = prevX;
                      tetri.y = prevY;
                      tetri.lowest_y = lowestPrevY;
                    } } } } } } 
         
        }
        //if(keyCode == DOWN){
        //  points++;
        //  tetri.down();
        //  updateScore();
        //}
        if(keyCode == LEFT && canShiftLeft()){
          tetri.left();
        }
        if(keyCode == RIGHT && canShiftRight()){
          tetri.right();
        }
        tetri.drawBlock(findColor(tetri.c));
      }
    }
    else{
      if(key == ' '){
        // spacebar - block down immediately
        points += 50 - tetri.y;
        tetri.drawBlock(0);
        while (shouldDraw){
          tetri.down();
          changeShouldDraw();
        }
        tetri.drawBlock(findColor(tetri.c));
      }
    }
}

public boolean isValid() {
  for (int i = 0; i < tetri.block.length; i++) {
    for (int j = 0; j < tetri.block[0].length; j++) {
      int ii = i + tetri.y;
      int jj = j + tetri.x;
      if (19 - ii < 0 || jj < 0 || jj > 9 || grid.get(19 - ii)[jj] != 0) {
        return false;
      }
    }
  }
  return true;
}

public void updateScore() {
  fill(0);
  rectBorder(400, 150, 1000, 20); // current score sign
  rectBorder(400, 150, 1000, 190); // lines cleared sign
  fill(255);
  text("Points:", 1100, 70);
  text(points, 1100, 130);
  text("Lines Cleared:", 1100, 250);
  text(linesCleared, 1100, 300);
}
  

void displayNext(int c){
  stroke(0);
  nextX = next.x;
  nextY = next.y;
 next.x = -10;
 next.y = 1;
  for (int i = 0; i < next.block.length; i++){ // y
      for (int j = 0; j < next.block[0].length; j++){ // x
        if(next.block[i][j] == 1){
          int x = next.x+j;
          int y = next.y+i;
          fill(findColor(c));
      square(x*43 + 530, y*43 + 20, 43);
        }
      }
  }
  next.x = nextX;
  next.y = nextY;
}

}
