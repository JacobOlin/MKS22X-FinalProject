Hero h;
int coolDown;
ArrayList<Walls> ListOfWalls;
Walls w;

void setup() {
  size(768,528);
  background(255);
  rectMode(CENTER);
  h = new Hero(48,48,width/2-24,height/2);
  coolDown = 0;
  ListOfWalls = new ArrayList<Walls>();
  //int a = (int)(random(11));
  //for (int i = 0;i < a;i += 1) {
  //  Wall 
  w = new Walls(3,3);
}

void draw() {
  background(255);
  w.display();
  if (coolDown > 0) {
    coolDown -= 1;
  }
  if (keyPressed && coolDown == 0) {
    if ((key == 'W' || key == 'w') && h.y - h.Imgh/2 > 0) {
      h.y -= 48;
      coolDown = 10;
    }
    if ((key == 'A' || key == 'a') && h.x - h.Imgw/2 > 0) {
      h.x -= 48;
      coolDown = 10;
    }
    if ((key == 'S' || key == 's') && h.y + h.Imgh/2 < height) {
      h.y += 48;
      coolDown = 10;
    }
    if ((key == 'D' || key == 'd') && h.x + h.Imgw/2 < width) {
      h.x += 48;
      coolDown = 10;
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
  int x,y;
  
  Walls(int xCor,int yCor) {
    x = xCor;
    y = yCor;
  }
  
  void display() {
    fill(0,0,255);
    rect(48*x+24,48*y+24,48,48);
  }
}