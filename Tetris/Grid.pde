public class Grid {
  int[][] grid;
  ArrayList<String> toSpawn;
<<<<<<< HEAD
  Blocks curr;
=======
  public Blocks tetri;
>>>>>>> f6548547ac630e4e1accd9b11c1381663996a64d

  // creates an griday representing the playable grid
  public Grid() { 
    grid = new int[22][12];
    for (int i = 0; i < grid.length; i++){
      grid[i][0] = 2;
      grid[i][11] = 2;
    }
    for (int i = 0; i < grid[0].length; i++){
      grid[21][i] = 2;
    }
    toSpawn = new ArrayList<String>();
    refill();
    spawnBlocks();
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
   if (type.equals("I")) { curr = new I(); }
   if (type.equals("J")) { curr = new J(); }
   if (type.equals("L")) { curr = new L(); }
   if (type.equals("O")) { curr = new O(); }
   if (type.equals("S")) { curr = new S(); }
   if (type.equals("T")) { curr = new T(); }
   if (type.equals("Z")) { curr = new Z(); }
  }
  
  
  // Ivy's code

public void run(){
<<<<<<< HEAD
  curr.fall();
}

public void display(){
  int[][] blocks = curr.block;
  for (int i = 0; i < blocks.length; i++){
    for (int j = 0; j < blocks[0].length; j++){
      if(blocks[i][j] == 1){
        int x = curr.x+i;
        int y = curr.y+j;
        //grid[x][y] = 1;
        fill(curr.c);
        square(x*43 + 530, y*43 + 20, 43);
      }
    }
  }
}

=======
  drawBlock(tetri, tetri.c, 0);
  delay(1000);
  drawBlock(tetri, 0, 255);
  tetri.down();
  drawBlock(tetri, tetri.c, 0);
}

public void display(int x, int y){
  square(x*43 + 530, y*43 + 20, 43);
}

public void drawBlock(Blocks curr, color c, color s){
  int[][] blocks = curr.block;
  for (int i = 0; i < blocks.length; i++){
    for (int j = 0; j < blocks[0].length; j++){
      if(blocks[i][j] == 1){
        int x = curr.x+j - blocks[0].length/2;
        int y = curr.y+i;
        stroke(s);
        fill(c);
        display(x,y);
      }
    }
  }
}

>>>>>>> f6548547ac630e4e1accd9b11c1381663996a64d
}
