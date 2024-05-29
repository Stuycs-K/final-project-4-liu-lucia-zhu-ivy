/// Blocks Class
class Blocks{
  private String type;
  private double speed;
  public int x,y;
  public color c;
  public int[][] block;
  public final int pixSize = 43;
  
  public Blocks(String name, int row, int col){
    type = name;
    speed = 1;
    x = 5;
    y = 0;
    c = color(random(255), random(255), random(255));
    block = new int[row][col];
  }
  
    public void keyPressed(){
    if(key == CODED){
      if(keyCode == UP){
        up();
      }
      if(keyCode == DOWN){
        down();
      }
      if(keyCode == LEFT){
        left();
      }
      if(keyCode == RIGHT){
        right();
      }
      if(keyCode == 32){
        space();
      }
    }
  }
  
  public void up(){
    // rotates block
  }
  
  public void down(){
    // moves block down one unit
    y++;
  }
  
  public void left(){
    x--;
  }
  
  public void right(){
    x++;
  }
  
  public void space(){
    // block down immediately
  }
  
  public String getType(){
    return type;
  }
  
  public double getSpeed(){
    return speed;
  }
  
  public void fall(){
    // change speed and y-cor
  }
}
