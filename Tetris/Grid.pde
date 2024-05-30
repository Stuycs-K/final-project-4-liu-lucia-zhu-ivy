public class Grid {
  int[][] grid;
  ArrayList<String> toSpawn;
  public Blocks tetri;

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
   if (type.equals("I")) { tetri = new I(); }
   if (type.equals("J")) { tetri = new J(); }
   if (type.equals("L")) { tetri = new L(); }
   if (type.equals("O")) { tetri = new O(); }
   if (type.equals("S")) { tetri = new S(); }
   if (type.equals("T")) { tetri = new T(); }
   if (type.equals("Z")) { tetri = new Z(); }
  }
  
 

public void run(){
  Blocks curr = tetri;
  int[][] blocks = curr.block;
  for (int i = 0; i < blocks.length; i++){
    for (int j = 0; j < blocks[0].length; j++){
      if(blocks[i][j] == 1){
        int x = curr.x+j - blocks[0].length/2;
        int y = curr.y+i;
        fill(curr.c);
        display(x,y);
      }
    }
  }
}

public void display(int x, int y){
  square(x*43 + 530, y*43 + 20, 43);
}

}
