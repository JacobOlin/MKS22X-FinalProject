public class Hero implements Fightable{
  int Imgh,Imgw,x,y,hp,dmg,slowMoveX,slowMoveY,arrows,keys;
  char direction;
  PImage right,rightAttack,left,leftAttack,up,upAttack,down,downAttack,current;
  Hero(int he,int wi,int startx,int starty) {
    Imgh = he;
    Imgw = wi;
    x = startx;
    y = starty;
    hp = 15;
    dmg = 2;
    direction = 'u';
    arrows = 20;
    keys = 5;
    right = loadImage("right.png");
    rightAttack = loadImage("rightAttack.png");
    left = loadImage("left.png");
    leftAttack = loadImage("leftAttack.png");
    up = loadImage("up.png");
    upAttack = loadImage("upAttack.png");
    down = loadImage("down.png");
    downAttack = loadImage("downAttack.jpg");
  }
  
  void display() {
    //fill(0,255,0);
    //rect(x,y,Imgh,Imgw);
    if (direction == 'u') {
      current = up;
    }
    if (direction == 'd') {
      current = down;
    }
    if (direction == 'l') {
      current = left;
    }
    if (direction == 'r') {
      current = right;
    }
    image(current,x-24,y-24,Imgh,Imgw);
  }

  void takeDamage(int amount) {
    hp -= amount;
    if (hp < 0) {
      hp = 0;
    }
  }

  void attack() {
    if (keyPressed && coolDown == 0) {
      if (key == 'x' || key == 'X') {
        //background(255,0,0);
        //coolDown = 10;
        if (direction == 'u') {
          fill(255, 0, 0);
          rect(x, y-48, 48, 48);
          dealDamage(Enemies);
          unlockDoor(ListOfDoors);
        }
        if (direction == 'l') {
          fill(255, 0, 0);
          rect(x-48, y, 48, 48);
          //println("left");;
          dealDamage(Enemies);
          unlockDoor(ListOfDoors);
        }
        if (direction == 'd') {
          fill(255, 0, 0);
          rect(x, y+48, 48, 48);
          // check to see if there is an enemy in the attack range
          dealDamage(Enemies);
          unlockDoor(ListOfDoors);
        }
        if (direction == 'r') {
          fill(255, 0, 0);
          rect(x+48, y, 48, 48);
          dealDamage(Enemies);
          unlockDoor(ListOfDoors);
        }
      }
    }
  }
  
  void bow(){
    if (keyPressed && coolDown == 0 && arrows > 0) {
      if (key == 'c' || key == 'C') {
        arrows -=1;
        //background(255,0,0);
        //coolDown = 10;
        if (direction == 'u') {
          Arrows.add( new Arrow( x * 1.0, y * 1.0, 0.0, -3.0, loadImage("ArrowU.jpg")));
        } 
        if (direction == 'l') {
          Arrows.add( new Arrow( x * 1.0, y * 1.0, -3.0, 0.0, loadImage("ArrowL.jpg")));
        }
        if (direction == 'd') {
          Arrows.add( new Arrow( x * 1.0, y * 1.0, 0.0, 3.0, loadImage("ArrowD.jpg")));
        }
        if (direction == 'r') {
          Arrows.add( new Arrow( x * 1.0, y * 1.0, 3.0, 0.0, loadImage("ArrowR.jpg")));
        }
      }
    }
  }

  void move() {
    if (keyPressed && coolDown == 0) {
      if ((key == 'W' || key == 'w') && y - Imgh/2 > 48) {
        direction = 'u';
        boolean canMove = true;
        for (Wall w : ListOfWalls) {
          if (x/48 == w.x && y/48 - 1 == w.y) {
            canMove = false;
          }
        }
        for (LockedDoor d: ListOfDoors) {
          if (x/48 == d.x && y/48 - 1 == d.y && d.isLocked) {
            canMove = false;
          }
        }
        boolean canMoveWall = true;
        boolean nextToWall = false;
        for (MovableWall w : ListOfMovableWalls) {
          for (Wall w2 : ListOfWalls) {
            if (w.x == w2.x && w.y - 1 == w2.y) {
              canMoveWall = false;
            }
          }
          if (x/48 == w.x && y/48 - 1 == w.y) {
            //ListOfWalls.add(new Wall(w.x,w.y - 1));
            //background(255);
            //w.changeYCor(-1);
            //println(w.y);
            if (canMoveWall) {
              w.coolDown = 8;
              w.slowMoveX = 0;
              w.slowMoveY = -6/48.0;
              movingWall = w;
            }
            nextToWall = true;
          }
        }
        if (canMove && (canMoveWall || !nextToWall)) {
          //y -= 48;
          slowMoveX = 0;
          slowMoveY = -6;
          coolDown = 8;
        }
      }
      if ((key == 'W' || key == 'w') && y - Imgh/2 <= 48) {
        direction = 'u';
        roomY -= 1;
        y = height - 72;
        coolDown = 8;
        slowMoveX = 0;
        slowMoveY = 0;
        ListOfMovableWalls = new ArrayList<MovableWall>();
        if (MovableWallsInput[roomY*6+roomX].length > 0) {
          ListOfMovableWalls.add(new MovableWall(MovableWallsInput[roomY*6+roomX][0], MovableWallsInput[roomY*6+roomX][1]));
        }
       changeEnemies();
      }
      if ((key == 'A' || key == 'a') && x - Imgw/2 > 48) {
        direction = 'l';
        boolean canMove = true;
        for (Wall w : ListOfWalls) {
          if (x/48 - 1 == w.x && y/48 == w.y) {
            canMove = false;
          }
        }
        for (LockedDoor d: ListOfDoors) {
          if (x/48 - 1 == d.x && y/48 == d.y && d.isLocked) {
            canMove = false;
          }
        }
        boolean canMoveWall = true;
        boolean nextToWall = false;
        for (MovableWall w : ListOfMovableWalls) {
          for (Wall w2 : ListOfWalls) {
            if (w.x - 1== w2.x && w.y == w2.y) {
              canMoveWall = false;
            }
          }
          if (x/48 - 1== w.x && y/48 == w.y) {
            if (canMoveWall) {
              w.coolDown = 8;
              w.slowMoveX = -6/48.0;
              w.slowMoveY = 0;
              movingWall = w;
            }
            nextToWall = true;
          }
        }
        if (canMove && (canMoveWall || !nextToWall)) {
          //x -= 48;
          slowMoveX = -6;
          slowMoveY = 0;        
          coolDown = 8;
        }
      }
      if ((key == 'A' || key == 'a') && x - Imgw/2 <= 48) {
        direction = 'l';
        roomX -= 1;
        x = width - 72;
        coolDown = 8;
        slowMoveX = 0;
        slowMoveY = 0;
        ListOfMovableWalls = new ArrayList<MovableWall>();
        if (MovableWallsInput[roomY*6+roomX].length > 0) {
          ListOfMovableWalls.add(new MovableWall(MovableWallsInput[roomY*6+roomX][0], MovableWallsInput[roomY*6+roomX][1]));
        }
        changeEnemies();
      }
      if ((key == 'S' || key == 's') && y + Imgh/2 < height - 48) {
        direction  = 'd';
        boolean canMove = true;
        for (Wall w : ListOfWalls) {
          if (x/48 == w.x && y/48 + 1 == w.y) {
            canMove = false;
          }
        }
        for (LockedDoor d: ListOfDoors) {
          if (x/48 == d.x && y/48 + 1 == d.y && d.isLocked) {
            canMove = false;
          }
        }
        boolean canMoveWall = true;
        boolean nextToWall = false;
        for (MovableWall w : ListOfMovableWalls) {
          for (Wall w2 : ListOfWalls) {
            if (w.x == w2.x && w.y + 1 == w2.y) {
              canMoveWall = false;
            }
          }
          if (x/48== w.x && y/48 + 1 == w.y) {
            if (canMoveWall) {
              w.coolDown = 8;
              w.slowMoveX = 0;
              w.slowMoveY = 6/48.0;
              movingWall = w;
            }
            nextToWall = true;
          }
        }
        if (canMove && (canMoveWall || !nextToWall)) {
          //y += 48;
          slowMoveX = 0;
          slowMoveY = 6;
          coolDown = 8;
        }
      }
      if ((key == 'S' || key == 's') && y + Imgh/2 >= height - 48) {
        direction = 'd';
        roomY += 1;
        y = 72;
        coolDown = 8;
        slowMoveX = 0;
        slowMoveY = 0;
        ListOfMovableWalls = new ArrayList<MovableWall>();
        if (MovableWallsInput[roomY*6+roomX].length > 0) {
          ListOfMovableWalls.add(new MovableWall(MovableWallsInput[roomY*6+roomX][0], MovableWallsInput[roomY*6+roomX][1]));
        }
        changeEnemies();
      }
      if ((key == 'D' || key == 'd') && x + Imgw/2 < width - 48) {
        direction = 'r';
        boolean canMove = true;
        for (Wall w : ListOfWalls) {
          if (x/48 + 1 == w.x && y/48== w.y) {
            canMove = false;
          }
        }
        for (LockedDoor d: ListOfDoors) {
          if (x/48 + 1 == d.x && y/48 == d.y && d.isLocked) {
            canMove = false;
          }
        }
        boolean canMoveWall = true;
        boolean nextToWall = false;
        for (MovableWall w : ListOfMovableWalls) {
          for (Wall w2 : ListOfWalls) {
            if (w.x + 1 == w2.x && w.y == w2.y) {
              canMoveWall = false;
            }
          }
          if (x/48 + 1== w.x && y/48 == w.y) {
            if (canMoveWall) {
              w.coolDown = 8;
              w.slowMoveX = 6/48.0;
              w.slowMoveY = 0;
              movingWall = w;
            }
            nextToWall = true;
          }
        }
        if (canMove && (canMoveWall || !nextToWall)) {
          //x += 48;
          slowMoveX = 6;
          slowMoveY = 0;
          coolDown = 8;
        }
      }
      if ((key == 'D' || key == 'd') && x + Imgh/2 >= width - 48) {
        direction = 'r';
        roomX += 1;
        x = 72;
        coolDown = 8;
        slowMoveX = 0;
        slowMoveY = 0;
        ListOfMovableWalls = new ArrayList<MovableWall>();
        if (MovableWallsInput[roomY*6+roomX].length > 0) {
          ListOfMovableWalls.add(new MovableWall(MovableWallsInput[roomY*6+roomX][0], MovableWallsInput[roomY*6+roomX][1]));
        }
        changeEnemies();
      }
    }
  }

  void dealDamage(ArrayList<Enemies> List) {
    for (int i = 0; i < List.size(); i++) {
      Enemies e = List.get(i);

      if (direction == 'd') {
        if ( x + 24 >= e.x && x - 24 <= e.x && y <= e.y && y + 48 >= e.y) {
          e.takeDamage(dmg);
        }
      }

      if ( direction == 'u') {
        if ( x + 24 >= e.x && x - 24 <= e.x && y >= e.y && y - 48 <= e.y)
        {
          e.takeDamage(dmg);
        }
      }

      if ( direction == 'l') {
        if ( x - 48 <= e.x && x >= e.x && y -24 <= e.y && y + 24 >= e.y) {
          e.takeDamage(dmg);
        }
      }

      if ( direction == 'r') {
        if ( x <= e.x && x+ 48 >= e.x && y -24 <= e.y && y + 24 >= e.y) {
          e.takeDamage(dmg);
        }
      }
    }
  }
  
  void unlockDoor(ArrayList<LockedDoor> List) {
    for (int i = 0; i < List.size(); i++) {
      LockedDoor d = List.get(i);

      if (direction == 'd') {
        if (x/48 == d.x && y/48 + 1 == d.y) {
          if (keys > 0) {
            d.unlock();
            keys -= 1;
          }
        }
      }

      if ( direction == 'u') {
        if (x/48 == d.x && y/48 - 1 == d.y)
        {
          if (keys > 0) {
            d.unlock();
            keys -= 1;
          }
        }
      }

      if ( direction == 'l') {
        if (x/48 - 1 == d.x && y/48 == d.y) {
          if (keys > 0) {
            keys -= 1;
            d.unlock();
          }
        }
      }

      if ( direction == 'r') {
        if (x/48 + 1 == d.x && y/48 == d.y) {
          if (keys > 0) {
            d.unlock();
            keys -= 1;
          }
        }
      }
    }
  }
}

public class Arrow{
  int damage;
  float x;
  float y;
  float xspeed;
  float yspeed;
  int size;
  int time;
  PImage image;
  
  
  public void collide(){
    for( int i = 0; i < Enemies.size(); i++){
      Enemies e = Enemies.get(i);
      if (e.x + size * 2 > x && e.x - size * 2 < x && e.y + size * 2 > y && e.y - size * 2 < y) {
        e.takeDamage(1);
        time = 0;
      }
    }
  }
  
  public void move(){
    x += xspeed;
    y += yspeed;
  }
  
  public Arrow(float x, float y, float xspeed, float yspeed, PImage image){
    this.x = x;
    this.y =y;
    this.xspeed = xspeed;
    this.yspeed = yspeed;
    time = 30;
    size = 20;
    this.image = image;
  }
  
  public void display(){
    image(image, x, y, size, size);
  }
}
  
  
  
  
