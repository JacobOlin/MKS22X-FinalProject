Hero h;

void setup() {
  size(600,600);
  background(255);
  rectMode(CENTER);
  h = new Hero(20,20,height/2,width/2);
}

void draw() {
  h.display();
}

public class Hero{
  int h,w,x,y;
  Hero(int he,int wi,int startx,int starty) {
    h = he;
    w = wi;
    x = startx;
    y = starty;
  }
  
  void display() {
    fill(0,255,0);
    rect(x,y,h,w);
  }
  
}
    
