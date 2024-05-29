public class Grid {
  int[][] arr;
  ArrayList<String> toSpawn;
  Blocks tetri;

  // creates an array representing the playable grid
  public Grid() { 
    arr = new int[22][12];
    toSpawn = new ArrayList<String>();
    fill();
  }
  
  // refills the bag (toSpawn) of possible "next" blocks
  void fill() {
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
      fill();
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
  
  void drawGrid() {
    
  }
  


int[][] grid;
ArrayList<Blocks> toSpawn;

public void run(){
  Blocks curr = toSpawn.remove(0);
  int[][] blocks = curr.block;
  for (int i = 0; i < blocks.length; i++){
    for (int j = 0; j < blocks[0].length; j++){
      if(blocks[i][j] == 1){
        int x = curr.x+i;
        int y = curr.y+j;
        grid[x][y] = 1;
        display(x,y);
      }
    }
  }
}

public void display(int x, int y){
  square(x*43 + 530, y*43 + 20, 43);
}

}
