class S extends Blocks{
  private boolean flip = false;
  
  public S(){
    super("S", 3, 3);
    block[0][1] = 1;
    block[0][2] = 1;
    block[1][0] = 1;
    block[1][1] = 1;
  }
  
  public void up(){
    block = new int[3][3];
    if (flip){
      block[0][1] = 1;
      block[1][1] = 1;
      block[1][2] = 1;
      block[2][2] = 1;
    } else{
      block[0][1] = 1;
      block[0][2] = 1;
      block[1][0] = 1;
      block[1][1] = 1;
    }
    flip = !flip;
  }
  
}
  
