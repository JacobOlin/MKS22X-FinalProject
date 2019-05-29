Hero h;
int coolDown;
Tektite u, d, l, r;
ArrayList<Enemies> Enemies;

void setup() {
  size(600, 600);
  background(255);
  rectMode(CENTER);
  Enemies = new ArrayList<Enemies>();
  h = new Hero(20, 20, height/2, width/2);
  d = new Tektite(20, 20, height/2, width/2 + 35);
  u = new Tektite(20, 20, height/2, width/2 - 35);
  l = new Tektite(20, 20, height/2 - 35, width/2 );
  r = new Tektite(20, 20, height/2 + 35, width/2 );
  Enemies.add(d);
  Enemies.add(r);
  Enemies.add(u);
  Enemies.add(l);
}

void draw() {
  background(255);
  if (coolDown > 0) {
    coolDown -= 1;
    h.x += h.slowMoveX;
    h.y += h.slowMoveY;
  }
  h.move();
  h.attack();
  h.display();
  showEnemies(); // displays all the Enemies
  die();         // checks the list of enemies and removes them if they need to die
}

void die() {
  for ( int i = 0; i < Enemies.size(); i++) {
    if (Enemies.get(i).die()) {
      Enemies.remove(i);
      i--;
    }
  }
}

void showEnemies() {
  for ( int i = 0; i < Enemies.size(); i++) {
    Enemies.get(i).display();
  }
}
