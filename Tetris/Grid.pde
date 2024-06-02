import java.util.*;
import java.io.*;

public class Grid {
  String[][] grid;
  ArrayList<String> toSpawn;
  public Blocks tetri;

  // creates an grid representing the playable grid
  public Grid() { 
    grid = new String[22][12];
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {
        grid[i][j] = "0";
      }
    }
    for (int i = 0; i < grid.length; i++){
      grid[i][0] = "2";
      grid[i][11] = "2";
    }
    for (int i = 0; i < grid[0].length; i++){
      grid[21][i] = "2";
    }
    toSpawn = new ArrayList<String>();
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
  void spawnBlocks() {
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

public void draw(){
    tetri.draw();
    drawGrid();
}

public void display(int x, int y){
  stroke(255);
  square(x*43 + 530, y*43 + 20, 43);
}

public void drawGrid() {
  //Blocks hey = new Blocks("J");
  inputBlock(tetri);
  stroke(255);
  for (int i = 1; i <= 20; i++) {
    for (int j = 1; j <= 10; j++) {
      if (grid[i][j].equals("0")) {
        //System.out.println("true");
        fill(0);
      }
      else if (grid[i][j].equals("1")) {
        fill(tetri.c);
        grid[i][j] = "0";
      }
      else {
        fill(find_color(i, j));
      }
      display(j - 1, i - 1);
    }
  }
}


public void inputBlock(Blocks t) {
   int[][] blocks = t.block;
   for (int i = 0; i < blocks.length; i++) {
      System.out.println(Arrays.toString(blocks[i]));
    }
  for (int i = 0; i < blocks.length; i++){
      for (int j = 0; j < blocks[0].length; j++){
        if(blocks[i][j] == 1){
          int x = tetri.x+j - blocks[0].length/2;
          int y = tetri.y+i + 1;
          grid[y][x] = "1";
        }
      }
  }
   for (int i = 0; i < grid.length; i++) {
      System.out.println(Arrays.toString(grid[i]));
    }
}

public color find_color(int x, int y) {
  return color(100);
}
}

//for (int i = 530; i <= 917; i = i + 43) {
//    for (int j = 20; j <= 860; j = j + 43) {

  

//public void drawBlock(Blocks tetri, color c, color s){
//    stroke(s);
//    fill(c);
//    int[][] blocks = tetri.block;
//    for (int i = 0; i < blocks.length; i++){
//      for (int j = 0; j < blocks[0].length; j++){
//        if(blocks[i][j] == 1){
//          int x = tetri.x+j - blocks[0].length/2;
//          int y = tetri.y+i;
//          //System.out.println(x + ", " + y);
//          //System.out.println("Tetri y: " + tetri.y);
//            display(x,y);
//          }
//        }
//      }
//}
