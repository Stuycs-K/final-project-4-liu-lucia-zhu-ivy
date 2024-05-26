class I extends Blocks{
  private boolean flip = false;
  
  public I(){
    super("I", 4, 4);
    for (int i = 0; i < 4; i++){
      block[0][i] = 1;
    }
  }
  
  public void up(){
    if (flip){
      for (int i = 0; i < 4; i++){
        block[i][1] = 1;
      }
    }
    else {
      for (int i = 0; i < 4; i++){
        block[0][i] = 1;
      }
    }
  }
}
  
