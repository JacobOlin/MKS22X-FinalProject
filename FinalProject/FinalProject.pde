Hero h;

void setup() {
  size(600,600);
  background(255);
  rectMode(CENTER);
  h = new Hero(20,20,height/2,width/2);
}

void draw() {
  background(255);
  if (keyPressed) {
    if (key == 'W' || key == 'w') {
      h.y -= 1;
    }
    if (key == 'A' || key == 'a') {
      h.x -= 1;
    }
    if (key == 'S' || key == 's') {
      h.y += 1;
    }
    if (key == 'D' || key == 'd') {
      h.x += 1;
    }
  }
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
    
