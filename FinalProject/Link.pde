public class Hero implements Fightable{
  int Imgh,Imgw,x,y,hp,dmg,slowMoveX,slowMoveY;
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
        }
        if (direction == 'l') {
          fill(255, 0, 0);
          rect(x-48, y, 48, 48);
          dealDamage(Enemies);
        }
        if (direction == 'd') {
          fill(255, 0, 0);
          rect(x, y+48, 48, 48);
          // check to see if there is an enemy in the attack range
          dealDamage(Enemies);
        }
        if (direction == 'r') {
          fill(255, 0, 0);
          rect(x+48, y, 48, 48);
          dealDamage(Enemies);
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
      if ((key == 'W' || key == 'w') && y - Imgh/2 == 0) {
        direction = 'u';
        roomY -= 1;
        y = height - 24;
        coolDown = 8;
        slowMoveX = 0;
        slowMoveY = 0;
        ListOfMovableWalls = new ArrayList<MovableWall>();
        if (MovableWallsInput[roomY*6+roomX].length > 0) {
          ListOfMovableWalls.add(new MovableWall(MovableWallsInput[roomY*6+roomX][0], MovableWallsInput[roomY*6+roomX][1]));
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
      if ((key == 'A' || key == 'a') && x - Imgw/2 == 0) {
        direction = 'l';
        roomX -= 1;
        x = width - 24;
        coolDown = 8;
        slowMoveX = 0;
        slowMoveY = 0;
        ListOfMovableWalls = new ArrayList<MovableWall>();
        if (MovableWallsInput[roomY*6+roomX].length > 0) {
          ListOfMovableWalls.add(new MovableWall(MovableWallsInput[roomY*6+roomX][0], MovableWallsInput[roomY*6+roomX][1]));
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
      if ((key == 'S' || key == 's') && y + Imgh/2 == height) {
        direction = 'd';
        roomY += 1;
        y = 24;
        coolDown = 8;
        slowMoveX = 0;
        slowMoveY = 0;
        ListOfMovableWalls = new ArrayList<MovableWall>();
        if (MovableWallsInput[roomY*6+roomX].length > 0) {
          ListOfMovableWalls.add(new MovableWall(MovableWallsInput[roomY*6+roomX][0], MovableWallsInput[roomY*6+roomX][1]));
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
      if ((key == 'D' || key == 'd') && x + Imgh/2 == width) {
        direction = 'r';
        roomX += 1;
        x = 24;
        coolDown = 8;
        slowMoveX = 0;
        slowMoveY = 0;
        ListOfMovableWalls = new ArrayList<MovableWall>();
        if (MovableWallsInput[roomY*6+roomX].length > 0) {
          ListOfMovableWalls.add(new MovableWall(MovableWallsInput[roomY*6+roomX][0], MovableWallsInput[roomY*6+roomX][1]));
        }
      }
    }
  }

  void dealDamage(ArrayList<Enemies> List) {
    for (int i = 0; i < List.size(); i++) {
      Enemies e = List.get(i);
      //println("player dmg " + dmg);
      //println("player y " + y);
      //println("enemy hp " + e.hp);
      //println("enemy y " + e.y);

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
}
