public class Hero implements Fightable {
  int Imgh, Imgw, x, y, hp, dmg, slowMoveX, slowMoveY;
  char direction;
  Hero(int he, int wi, int startx, int starty) {
    Imgh = he;
    Imgw = wi;
    x = startx;
    y = starty;
    hp = 100;
    dmg = 10;
    direction = 'd';
  }

  void display() {
    fill(0, 255, 0);
    rect(x, y, Imgh, Imgw);
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
        }
        if (direction == 'l') {
          fill(255, 0, 0);
          rect(x-48, y, 48, 48);
        }
        if (direction == 'd') {
          fill(255, 0, 0);
          rect(x, y+48, 48, 48);
          // check to see if there is an eenmy in the attack range
        }
        if (direction == 'r') {
          fill(255, 0, 0);
          rect(x+48, y, 48, 48);
        }
      }
    }
  }


  void move() {
  } 

  // return true is there is an enemy infront of Link
  void dealDamage(ArrayList<Enemies> List) {
    for (int i = 0; i < List.size(); i++) {
      Enemies e = List.get(i);
      if ( x + 24 <= e.x && x - 24 >= e.x && y <= e.y && y + 48 >= e.y) {
        e.takeDamage(dmg);
      }
    }
  }
}
