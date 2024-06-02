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
     drawBlock(tetri.c);
  }
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
          grid.get(y)[x] = 1;
          rowSum[y]++;
          if (rowSum[y] == 10) {
            ans.add(y);
          }
          System.out.println("Inputted 1 in " + y + " " + x);
        }
      }
  }
  return ans;
}

public void clearLine(ArrayList<Integer> rows) {
  // implements clearing the line(s)
  if (rows.size() > 0) {
    if (rows.size() == 1) {
      points += 100;
    }
    if (rows.size() == 2) {
      points += 300;
    }
    if (rows.size() == 3) {
      points += 500;
    }
    if (rows.size() == 4) {
      points += 1200;
    }
  }
}

}
