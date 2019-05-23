Hero h;
Tektite t;

void setup() {
  size(600,600);
  background(255);
  rectMode(CENTER);
  h = new Hero(20,20,height/2,width/2);
  t = new Tektite(20,20, height/2, width/2);
}

void draw() {
  background(255);
  if (keyPressed) {
    if ((key == 'W' || key == 'w') && h.y - h.h/2 > 0) {
      h.y -= 2.5;
    }
    if ((key == 'A' || key == 'a') && h.x - h.w/2 > 0) {
      h.x -= 2.5;
    }
    if ((key == 'S' || key == 's') && h.y + h.h/2 < width) {
      h.y += 2.5;
    }
    if ((key == 'D' || key == 'd') && h.x + h.w/2 < height) {
      h.x += 2.5;
    }
  }
  h.display();
  t.display();
  
  
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
    
