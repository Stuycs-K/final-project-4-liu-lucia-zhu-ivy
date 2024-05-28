public class Grid {
  int[][] arr;
  ArrayList<String> toSpawn;
  
  // creates an array representing the playable grid
  public Grid() { 
    arr = new int[22][12];
    toSpawn = new ArrayList<String>();
    fill();
  }
  
  void fill() {
    String[] types = new String[] {"I", "J", "L", "O", "S", "T", "Z"};
    for (int i = 0; i < 7; i++) { 
      for (int j = 0; j < 4; j++) {
        toSpawn.add(types[i]);
      }
    }
  }
  
  void spawnBlocks() {
    if (toSpawn.size() == 0) {
      fill();
    }
   String type = toSpawn.get((int)(Math.random() * toSpawn.size()));
  }
  
  void drawGrid() {
    
  }
  
}
