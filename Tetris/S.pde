class S extends Blocks{
  private boolean flip = false;
  
  public S(){
    super("S");
    c = 5;
    x = 3;
    up();
  }
  
  public void up(){
    if (flip){
      block = new int[3][2];
      if (y > 16){
        y = 17;
      }
      lowest_y = y + 2;
      fixFloorRotation();
      block[0][0] = 1;
      block[1][0] = 1;
      block[1][1] = 1;
      block[2][1] = 1;
    } else{
      block = new int[2][3];
      lowest_y = y + 1;
      fixFloorRotation();
      block[0][1] = 1;
      block[0][2] = 1;
      block[1][0] = 1;
      block[1][1] = 1;
      if (x == 8){
        x--;
      }
    }
    flip = !flip;
  }
  
}
  
