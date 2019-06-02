public abstract class Enemies implements Fightable {
  int hp;
  int damage;
  int size;
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


  public abstract void attack();

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

  public void attack() {
    //if( dist(this.x, this.y, other.x, other.y) <=  
  }
  
  public void display(){
    super.display();
    image(image, x - 24,y -24,w,h);
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
  }

  public void attack() {
  }

  public void takeDamage(int damage) {
    hp -= damage;
  }
}

public class Aquamentus extends Enemies {

  public Aquamentus(int h, int w, int xpos, int ypos) {
    x = xpos;
    y=ypos;
    this.h =h;
    this.w =w;
    hp = 10;
    damage = 2;
  }

  public void move() {
  }

  public void attack() {
  }

  public void takeDamage(int damage) {
    hp -= damage;
  }
}

public class Fireball {
  int damage;
  int x;
  int y;
  int xspeed;
  int yspeed;
  int size;

  public void collide(Enemies other) {
    if (dist(this.x, this.y, other.x, other.y) <= (other.size + this.size) / 2) {
      other.takeDamage(damage);
    }
  }

  public void move() {
    x += xspeed;
    y += yspeed;
  }

  public Fireball(int damage, int x, int y, int xspeed, int yspeed) {
    this.damage = damage;
    this.x = x;
    this.y =y;
    this.xspeed = xspeed;
    this.yspeed = yspeed;
  }
}
