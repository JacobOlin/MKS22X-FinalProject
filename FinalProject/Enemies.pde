public abstract class Enemies implements Fightable {
  int hp;
  int damage;
  int size;
  int x;
  int y;
  int w;
  int h;

  public abstract void move();
  

  public abstract void takeDamage(int damage);
  

  public abstract void attack( int damage);

  public void display() {
    fill(255, 0, 255);
    rect(x, y, h, w);
  }
}

public class Tektite extends Enemies {

  public Tektite(int h, int w, int xpos, int ypos) {
    x = xpos;
    y=ypos;
    this.w = w;
    this.h = h;
    hp = 3;
    damage = 1;
  }

  public void move() {
  }

  public void attack(int damage) {
  }

  public void takeDamage(int damage) {
    hp -= damage;
  }
}

public class peahat extends Enemies {

  public peahat(int h, int w, int xpos, int ypos) {
    x = xpos;
    y=ypos;
    this.h = h;
    this.w=w;
    hp = 3;
    damage = 1;
  }

  public void move() {
  }

  public void attack(int damage) {
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

  public void attack(int damage) {
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
