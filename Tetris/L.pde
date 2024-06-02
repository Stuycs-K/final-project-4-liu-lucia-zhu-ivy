class L extends Blocks{
  private int flip = 0;
  
  public L(){
    super("L");
    c = 3;
    x = 4;
    up();
  }
  
    public void up(){
    // grid changes based on parity
    if (flip % 2 == 0){
       block = new int[2][3];
       lowest_y = y + 1;
       if(x == 9){
        x--;
       }
    }else{
      block = new int[3][2];
      lowest_y = y + 2;
    }
    // fill in block
    if (flip == 0){
      block[1][0] = 1;
      for (int i = 0; i < 3; i++){
        block[0][i] = 1;
      }
    } if (flip == 1){
      block[2][1] = 1;
      for (int i = 0; i < 3; i++){
        block[i][0] = 1;
      }
    } if (flip == 2){
      block[0][2] = 1;
      for (int i = 0; i < 3; i++){
        block[1][i] = 1;
      }
    } if (flip == 3){
      block[0][0] = 1;
      for (int i = 0; i < 3; i++){
        block[i][1] = 1;
      }
    }
    flip = (flip + 1) % 4;
  }
}
  
