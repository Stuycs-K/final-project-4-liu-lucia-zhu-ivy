class L extends Blocks{
  private int flip = 0;
  
  public L(){
    super("L", 3, 3);
    block[0][2] = 1;
    for (int i = 0; i < 3; i++){
      block[1][i] = 1;
    }
  }
  
    public void up(){
    flip = (flip + 1) % 4;
    block = new int[3][3];
    if (flip == 0){
      block[0][0] = 1;
      for (int i = 0; i < 3; i++){
        block[1][i] = 1;
      }
    } if (flip == 1){
      block[2][0] = 1;
      for (int i = 0; i < 3; i++){
        block[i][1] = 1;
      }
    } if (flip == 2){
      block[2][2] = 1;
      for (int i = 0; i < 3; i++){
        block[1][i] = 1;
      }
    } if (flip == 3){
      block[0][2] = 1;
      for (int i = 0; i < 3; i++){
        block[i][1] = 1;
      }
    }
    
  }
}
  
