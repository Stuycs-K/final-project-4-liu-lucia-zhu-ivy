/// Blocks Class
class Blocks{
  private String type;
  private double speed;
  public int x,y;
  public int lowest_y; // indicates the lowest y-cor the block takes up
  public int c; // colors indicated by int instead so it can be stored in grid
  public int[][] block;
  public final int pixSize = 43;
  public int b_time; // used to time fall()
  
  public Blocks(String name){
    type = name;
    speed = 1;
    y = 0;
    b_time = millis() + 1000;
  }
  
  void fall() {
    if (millis() > b_time) {
      y++;
      lowest_y++;
      b_time = millis() + 1000;
    }
  }
  
  public void up(){
    // rotates block
  }
  
  public void down(){
    // moves block down one unit
    if (lowest_y < 19) {
      y++;
      lowest_y++;
    }
  }
  
  public void left(){
    if (x > 0){
      x--;
    }
  }
  
  public void right(){
      if (block[0].length == 3){
        if (x < 7){
          x++;
        }
      }
      else if (block[0].length == 1){
        if (x < 9) {
          x++;
        }
      }
      else {
        if (x < 8) {
          x++;
        }
      }
  }
  
  
  public void space(){
    // block down immediately
  }
  
  public double getSpeed(){
    return speed;
  }
  

}
