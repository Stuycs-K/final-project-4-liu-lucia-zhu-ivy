public class Grid {
  int[][] grid;
  ArrayList<String> toSpawn;
  Blocks curr;

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
  
 

public void run(){
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

}
