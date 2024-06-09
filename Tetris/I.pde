class I extends Blocks{
  private boolean flip = true;
  
  public I(){
    super("I");
    c = 1;
    x = 4;
    up();
  }
  
  public void up(){
    if (flip){
      block = new int[4][1];
      x++;
      if (y > 15){
        y = 16;
      }
      lowest_y = y + 3;
      for (int i = 0; i < 4; i++){
        block[i][0] = 1;
      }
      fixFloorRotation();
    }
    else {
      block = new int[1][4];
      lowest_y = y;
      if (x > 0){
        x--;
      }
      if (x >= 6){
        x = 6;
      }
      if (lowest_y == 20) {
        lowest_y = 19;
        y = 19;
      }
      for (int i = 0; i < 4; i++){
        block[0][i] = 1;
      }
    }
    flip = !flip;
  }
}
  
