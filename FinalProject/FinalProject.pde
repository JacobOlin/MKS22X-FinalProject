Hero h;

void setup() {
  size(768,432);
  background(255);
  rectMode(CENTER);
  h = new Hero(48,48,width/2-24,height/2);
}

void draw() {
  background(255);
  if (keyPressed) {
    if ((key == 'W' || key == 'w') && h.y - h.Imgh/2 > 0) {
      h.y -= 48;
    }
    if ((key == 'A' || key == 'a') && h.x - h.Imgw/2 > 0) {
      h.x -= 48;
    }
    if ((key == 'S' || key == 's') && h.y + h.Imgh/2 < height) {
      h.y += 48;
    }
    if ((key == 'D' || key == 'd') && h.x + h.Imgw/2 < width) {
      h.x += 48;
    }
  }
  h.display();
}

public class Hero{
  int Imgh,Imgw,x,y;
  Hero(int he,int wi,int startx,int starty) {
    Imgh = he;
    Imgw = wi;
    x = startx;
    y = starty;
  }
  
  void display() {
    fill(0,255,0);
    rect(x,y,Imgh,Imgw);
  }
  
}

public class Walls{ 
  
}