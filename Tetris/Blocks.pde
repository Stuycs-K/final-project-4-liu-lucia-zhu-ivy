/// Blocks Class
abstract class Blocks{
  private String type;
  private double speed;
  private int x;
  
  public Blocks(String name, double s){
    type = name;
    speed = s;
    x = width /2;
  }
  
  public void keyPressed(){}
  
  public void up(){
    // rotates block
  }
  
  public void down(){
    // moves block down one unit
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
