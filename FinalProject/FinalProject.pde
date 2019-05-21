Hero h;
int coolDown;
ArrayList<Wall> ListOfWalls;
Wall w;

void setup() {
  size(768,528);
  background(255);
  rectMode(CENTER);
  h = new Hero(48,48,width/2-24,height/2);
  coolDown = 0;
  ListOfWalls = new ArrayList<Wall>();
  //int a = (int)(random(11));
  //for (int i = 0;i < a;i += 1) {
  //  Wall 
  w = new Wall(3,3);
  ListOfWalls.add(w);
}

void draw() {
  background(255);
  w.display();
  if (coolDown > 0) {
    coolDown -= 1;
  }
  h.move();
  h.attack();
  h.display();
}



public class Hero implements Fightable{
  int Imgh,Imgw,x,y,hp,dmg;
  Hero(int he,int wi,int startx,int starty) {
    Imgh = he;
    Imgw = wi;
    x = startx;
    y = starty;
    hp = 100;
    dmg = 10;
  }
  
  void display() {
    fill(0,255,0);
    rect(x,y,Imgh,Imgw);
  }
  
  void takeDmg(int amount) {
    hp -= amount;
    if (hp < 0) {
      hp = 0;
    }
  }
  
  void attack() {
    if(keyPressed && coolDown == 0) {
      if (key == 'x' || key == 'X') {
        background(255,0,0);
        coolDown = 10;
      }
    }
  }
  
  void move() {
  if (keyPressed && coolDown == 0) {
    if ((key == 'W' || key == 'w') && y - Imgh/2 > 0) {
      boolean canMove = true;
      for (Wall w : ListOfWalls) {
        if (x/48 == w.x && y/48 - 1 == w.y) {
          canMove = false;
        }
      }
      if (canMove) {
        y -= 48;
        coolDown = 10;
      }
    }
    if ((key == 'A' || key == 'a') && x - Imgw/2 > 0) {
      boolean canMove = true;
      for (Wall w : ListOfWalls) {
        if (x/48 - 1 == w.x && y/48 == w.y) {
          canMove = false;
        }
      }
      if (canMove) {
        x -= 48;
        coolDown = 10;
      }
    }
    if ((key == 'S' || key == 's') && y + Imgh/2 < height) {
      boolean canMove = true;
      for (Wall w : ListOfWalls) {
        if (x/48 == w.x && y/48 + 1 == w.y) {
          canMove = false;
        }
      }
      if (canMove) {
        y += 48;
        coolDown = 10;
      }
    }
    if ((key == 'D' || key == 'd') && x + Imgw/2 < width) {
      boolean canMove = true;
      for (Wall w : ListOfWalls) {
        if (x/48 + 1 == w.x && y/48== w.y) {
          canMove = false;
        }
      }
      if (canMove) {
        x += 48;
        coolDown = 10;
      }
    }   
  }
}  

  
}

public interface Fightable{
  void takeDmg(int amount);
  void attack();
  void move();
}

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