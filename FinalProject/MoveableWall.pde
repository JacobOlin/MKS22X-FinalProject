public class MovableWall /*extends Wall*/{ 
  float x,y;
  float slowMoveX,slowMoveY;
  int coolDown;
  
  
  MovableWall(int xCor,int yCor) {
    //super(xCor,yCor);
    x = xCor;
    y = yCor;
  }
  
  void changeXCor(float delta) {
    x += delta;
  }
  
  void changeYCor(float delta) {
    y += delta;
  }
  
  void display() {
    //fill(0,0,255);
    //rect(48*x+24,48*y+24,48,48);
    image(movablewall,x*48,y*48,48,48);
  }
  
  
}
