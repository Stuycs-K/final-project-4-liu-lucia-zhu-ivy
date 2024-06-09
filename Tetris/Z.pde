class Z extends Blocks{
  private boolean flip = false;
  
  public Z(){
    super("Z");
    c = 7;
    x = 4;
    up();
  }
  
  public void up(){
    if (flip){
      block = new int[3][2];
      lowest_y = y + 2;
      block[0][1] = 1;
      block[1][0] = 1;
      block[1][1] = 1;
      block[2][0] = 1;
    } else{
      block = new int[2][3];
      lowest_y = y + 1;
      block[0][0] = 1;
      block[0][1] = 1;
      block[1][1] = 1;
      block[1][2] = 1;
      if (x == 8){
        x--;
      }
    }
    flip = !flip;
  }
}
  
