public abstract class Enemies implements Fightable {
  int hp;
  int damage;
  int x;
  int y;
  int w;
  int h;
  PImage image;

  public void move() {
    float n = random(1000);
    if ( n >= 1 && n < 3) { // left
      boolean canMove = true;
      for (Wall w : ListOfWalls) {
        if (x/48 - 1 == w.x && y/48 == w.y) {
          canMove = false;
        }
      }
      if (canMove) {
        x -= 48;
      }
    }
    if ( n >= 3 && n < 5) { // right
      boolean canMove = true;
      for (Wall w : ListOfWalls) {
        if (x/48 + 1 == w.x && y/48== w.y) {
          canMove = false;
        }
      }
      if (canMove) {
        x += 48;
      }
    }
    if ( n >= 5 && n < 7) { // up
      boolean canMove = true;
      for (Wall w : ListOfWalls) {
        if (x/48 == w.x && y/48 - 1 == w.y) {
          canMove = false;
        }
      }
      if (canMove) {
        y -= 48;
      }
    } 
    if ( n >= 7 && n < 9) { // down
      boolean canMove = true;
      for (Wall w : ListOfWalls) {
        if (x/48 == w.x && y/48 + 1 == w.y) {
          canMove = false;
        }
      }
      if (canMove) {
        y += 48;
      }
    }
  }

  public abstract void takeDamage(int damage);


  public void attack() {
    //println("" + hero.hp);
    if (hero.x + w /2 > x && hero.x - w/2 < x && hero.y + h/2 > y && hero.y - h/2 < y) {
      hero.takeDamage(1);
      //println("Link hp = " + hero.hp);
    }
  }


  public void display() {
    fill(255, 0, 255);
    rect(x, y, h, w);
  }

  public boolean die() {
    return hp <= 0;
  }
}

public class Tektite extends Enemies {

  public Tektite(int h, int w, int xpos, int ypos) {
    x = xpos;
    y = ypos;
    this.w = w;
    this.h = h;
    hp = 3;
    damage = 1;
    image = loadImage("tektite.jpg");
  }

  public void display() {
    image(image, x - 24, y -24, w, h);
  }

  public void takeDamage(int damage) {
    hp -= damage;
  }
}

public class Peahat extends Enemies {

  public Peahat(int h, int w, int xpos, int ypos) {
    x = xpos;
    y=ypos;
    this.h = h;
    this.w=w;
    hp = 3;
    damage = 1;
    image = loadImage("peahat.png");
  }

  public void attack() {
  }

  public void takeDamage(int damage) {
    hp -= damage;
  }

  public void display() {
    image(image, x - 24, y -24, w, h);
  }
}

public class Aquamentus extends Enemies {

  public Aquamentus(int h, int w, int xpos, int ypos) {
    x = xpos;
    y=ypos;
    this.h =h;
    this.w =w;
    hp = 20;
    damage = 2;
    image = loadImage("Aquamentus.png");
  }

  public void move() { // Aquamentus isnt supposed to move
  }

  public void attack() { // spawns 3 fireballs 
    super.attack();
    float n = random(100);
    if ( n > 97) {
      Fireballs.add(new Fireball(x, y, -.6, .6));
      Fireballs.add(new Fireball(x, y, -.6, 0));
      Fireballs.add(new Fireball(x, y, -.6, -.6));
    }
  }

  public void takeDamage(int damage) {
    hp -= damage;
  }

  public void display() {
    image(image, x - 24, y -24, w, h);
  }
}

public class Fireball {
  int damage;
  float x;
  float y;
  float xspeed;
  float yspeed;
  int size;
  int time;
  PImage image;

  public void collide() {
    if (hero.x + size * 2 > x && hero.x - size * 2 < x && hero.y + size * 2 > y && hero.y - size * 2 < y) {
      hero.takeDamage(1);
      time = 0;
    }
  }

  public void move() {
    x += xspeed;
    y += yspeed;
  }

  public Fireball(float x, float y, float xspeed, float yspeed) {
    this.damage = 1;
    this.x = x;
    this.y =y;
    this.xspeed = xspeed;
    this.yspeed = yspeed;
    time = 400;
    size = 20;
    image = loadImage("fireball.png");
  }

  void display() {
    //println(time);
    //print("" + x +  ""  + y);;
    image(image, x, y, size, size);
  }
}
