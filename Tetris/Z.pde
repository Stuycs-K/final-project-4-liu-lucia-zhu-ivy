class Z extends Blocks{
  private boolean flip = false;
  
  public Z(){
    super("Z", 3, 3);
    block[0][0] = 1;
    block[0][1] = 1;
    block[1][1] = 1;
    block[1][2] = 1;
  }
  
  public void up(){
    if (flip){
      block[0][1] = 1;
      block[1][0] = 1;
      block[1][1] = 1;
      block[2][1] = 1;
    } else{
      block[0][0] = 1;
      block[0][1] = 1;
      block[1][1] = 1;
      block[1][2] = 1;
    }
    flip = !flip;
  }
}
  
