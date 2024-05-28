/// Grid Class

public class Grid {
//  int width;
//  int height;
  
//  public Grid() { 
//    width = 10;
//    height = 20;
//  }
  
//  public Grid(int w, int h) {
//    width = w;
//    height = h;
//}  

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
