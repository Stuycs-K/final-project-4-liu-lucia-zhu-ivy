class J extends Blocks{
  private int flip = 0;
  
  public J(){
    super("J");
    c = 2;
    x = 4;
    up();
  }
  
  public void up(){
    // grid changes based on parity
    if (flip % 2 == 0){
       block = new int[2][3];
       lowest_y = y + 1;
       //System.out.println(x);
       if(x == 8){
        x--;
       }
    }else{
      block = new int[3][2];
      if (y > 16){
        y = 17;
      }
      lowest_y = y + 2;
    }
    // fill in block
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
      block[1][2] = 1;
      for (int i = 0; i < 3; i++){
        block[0][i] = 1;
      }
    } if (flip == 3){
      block[0][1] = 1;
      for (int i = 0; i < 3; i++){
        block[i][0] = 1;
      }
    }
    flip = (flip + 1) % 4;
  }
}
  
