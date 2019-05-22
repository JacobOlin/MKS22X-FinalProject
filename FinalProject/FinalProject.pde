Hero h;
int coolDown;
ArrayList<Wall> ListOfWalls;
Wall w;
int roomX = 1;
int roomY = 1;
ArrayList<ArrayList<ArrayList<Wall>>> ListOfRooms;


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
  ListOfRooms = new ArrayList<ArrayList<ArrayList<Wall>>>();
  for (int i = 0;i < 3;i += 1) {
    ListOfRooms.add(new ArrayList<ArrayList<Wall>>());
    for (int j = 0;j < 3;j += 1) {
      ListOfRooms.get(i).add(new ArrayList<Wall>());
    }
  }
  ListOfRooms.get(1).get(1).add(new Wall(5,5));
  ListOfRooms.get(0).get(1).add(new Wall(0,0));
  //w = new Wall(3,3);
  //ListOfWalls.add(w);
}

void draw() {
  ListOfWalls = ListOfRooms.get(roomY).get(roomX);
  background(255);
  for (Wall w : ListOfWalls) {
    w.display();
  }
  if (coolDown > 0) {
    coolDown -= 1;
  }
  h.move();
  h.attack();
  h.display();
}



public class Hero implements Fightable{
  int Imgh,Imgw,x,y,hp,dmg;
  char direction;
  Hero(int he,int wi,int startx,int starty) {
    Imgh = he;
    Imgw = wi;
    x = startx;
    y = starty;
    hp = 100;
    dmg = 10;
    direction = 'd';
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
        //background(255,0,0);
        //coolDown = 10;
        if (direction == 'u') {
          fill(255,0,0);
          rect(x,y-48,48,48);
        }
        if (direction == 'l') {
          fill(255,0,0);
          rect(x-48,y,48,48);
        }
        if (direction == 'd') {
          fill(255,0,0);
          rect(x,y+48,48,48);
        }
        if (direction == 'r') {
          fill(255,0,0);
          rect(x+48,y,48,48);
        }
      }
    }
  }
  
  
  void move() {
  if (keyPressed && coolDown == 0) {
    if ((key == 'W' || key == 'w') && y - Imgh/2 > 0) {
      direction = 'u';
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
    if ((key == 'W' || key == 'w') && y - Imgh/2 == 0) {
      direction = 'u';
      boolean canMove = true;
      for (Wall w : ListOfWalls) {
        if (x/48 == w.x && y/48 - 1 == w.y) {
          canMove = false;
        }
      }
      if (canMove) {
        roomY -= 1;
        y += (height/48) - 1;
        coolDown = 10;
      }
    }
    if ((key == 'A' || key == 'a') && x - Imgw/2 > 0) {
      direction = 'l';
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
      direction  = 'd';
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
      direction = 'r';
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