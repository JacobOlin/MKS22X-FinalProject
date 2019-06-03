public class Wall{ 
  int x,y;
  
  Wall(int xCor,int yCor) {
    x = xCor;
    y = yCor;
  }
  
  void display() {
    fill(0,0,255);
    rect(48*x+24,48*y+24,48,48);
  }
}
