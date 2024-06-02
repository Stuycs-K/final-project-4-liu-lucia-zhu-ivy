import java.util.*;
import java.io.*;

public class Grid {
  //int[][] grid;
  ArrayList<int[]> grid;
  ArrayList<String> toSpawn;
  int[] rowSum;
  public Blocks tetri;
  public boolean stop;
  int points;

  // creates an grid representing the playable grid
  public Grid() { 
    //grid = new int[20][10];
    grid = new ArrayList<int[]>();
    for (int i = 0; i < 20; i++) {
      grid.add(new int[10]);
    }
    rowSum = new int[20];
    toSpawn = new ArrayList<String>();
    points = 0;
    tetri = new J();
    refill();
  }
  
  // refills the bag (toSpawn) of possible "next" blocks
  void refill() {
    String[] types = new String[] {"I", "J", "L", "O", "S", "T", "Z"};
    for (int i = 0; i < 7; i++) { 
      for (int j = 0; j < 4; j++) {
        toSpawn.add(types[i]);
      }
    }
  }
  
  // randomly chooses and spawns a block from toSpawn
  void spawnNew() {
    if (toSpawn.size() == 0) {
      refill();
    }
   String type = toSpawn.get((int)(Math.random() * toSpawn.size()));
   if (type.equals("I")) { tetri = new I(); }
   if (type.equals("J")) { tetri = new J(); }
   if (type.equals("L")) { tetri = new L(); }
   if (type.equals("O")) { tetri = new O(); }
   if (type.equals("S")) { tetri = new S(); }
   if (type.equals("T")) { tetri = new T(); }
   if (type.equals("Z")) { tetri = new Z(); }
  }
  
  
  // Ivy's code

public void run(){
  if (shouldStop()) {
    delay(700);
    inputBlock();
    spawnNew();
  }
  else {
    if (tetri.b_time < millis() + 10) {
      drawBlock(0);
    }
     tetri.fall();
     drawBlock(findColor(tetri.c));
  }
}

public color findColor(int c) {
  if (c == 0) { return color(48, 213, 200); }
  if (c == 1) { return color(0, 0, 255); }
  if (c == 2) { return color(255, 165, 0); }
  if (c == 3) { return color(255, 255, 0); }
  if (c == 4) { return color(170, 255, 0); }
  if (c == 5) { return color(191, 64, 191); }
  return color(255, 0, 0); 
}

public boolean shouldStop() {
  if (tetri.lowest_y >= 19) {
    return true;
  }
  boolean ans = false;
      for (int j = 0; j < tetri.block[0].length; j++){
      int iy = tetri.block.length - 1;
      int ix = tetri.x+j;
      while (tetri.block[iy][j] == 0) {
        iy--;
      }
      iy++;
      iy += tetri.y;
        if(grid.get(iy)[ix] == 1){
          ans = true;
        }
      }
      return ans;
  }
 
  

public void display(int x, int y){
  square(x*43 + 530, y*43 + 20, 43);
}


public void drawBlock(color c) {
  fill(c);
  stroke(255);
  for (int i = 0; i < tetri.block.length; i++){ // y
      for (int j = 0; j < tetri.block[0].length; j++){ // x
        if(tetri.block[i][j] == 1){
          int x = tetri.x+j;
          int y = tetri.y+i;
          display(x, y);
        }
      }
  }
}

public ArrayList<Integer> inputBlock() {
  ArrayList<Integer> ans = new ArrayList<Integer>();
  for (int i = 0; i < tetri.block.length; i++){
      for (int j = 0; j < tetri.block[0].length; j++){
        if(tetri.block[i][j] == 1){
          int x = tetri.x+j;
          int y = tetri.y+i;
          grid.get(y)[x] = tetri.c;
          rowSum[y]++;
          if (rowSum[y] == 10) {
            ans.add(y);
          }
        }
      }
  }
  return ans;
}

public void clearLine(ArrayList<Integer> rows) {
  int n = rows.size();
  // implements clearing the line(s)
  if (n > 0) {
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
  }
  while (n > 0) {
    
}

}
