/// Blocks Class
class Blocks{
  private String type;
  private double speed;
  public int x,y;
  public color c;
  public int[][] block;
  public final int pixSize = 43;
  public boolean active;
  
  public Blocks(String name){
    type = name;
    speed = 1;
    x = 5;
    y = 0;
    active = true;
    c = color(random(255), random(255), random(255));
  }
  
  public void up(){
    // rotates block
  }
  
  public void down(){
    // moves block down one unit
    y++;
  }
  
  public void left(){
    if (x - block[0].length/2 > 0){
      x--;
    }
  }
  
  public void right(){
    if (block[0].length == 3){
      if (x < 8){
        x++;
      }
    }
    else if (x + (block[0].length+1)/2 < 10){
      x++;
    }
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
    y++;
    delay(1000);
  }
}
