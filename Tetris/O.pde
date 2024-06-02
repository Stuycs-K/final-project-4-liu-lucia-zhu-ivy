class O extends Blocks{
  public O(){
    super("O");
    c = 3;
    x = 4;
    block = new int[2][2];
    lowest_y = y + 1;
    for (int i = 0; i < 2; i++){
      for (int j = 0; j < 2; j++){
        block[i][j] = 1;
      }
    }
  }
}
