class O extends Blocks{
  public O(){
    super("O");
    block = new int[2][2];
    for (int i = 0; i < 2; i++){
      for (int j = 0; j < 2; j++){
        block[i][j] = 1;
      }
    }
  }
}
