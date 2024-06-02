class I extends Blocks{
  private boolean flip = true;
  
  public I(){
    super("I");
    c = 1;
    x = 5;
    up();
  }
  
  public void up(){
    if (flip){
      block = new int[4][1];
      lowest_y = y + 3;
      for (int i = 0; i < 4; i++){
        block[i][0] = 1;
      }
    }
    else {
      block = new int[1][4];
      lowest_y = y;
      for (int i = 0; i < 4; i++){
        block[0][i] = 1;
      }
    }
    flip = !flip;
  }
}
  
