Hero h;
int coolDown;
Tektite t;

void setup() {
  size(600,600);
  background(255);
  rectMode(CENTER);
  h = new Hero(20,20,height/2,width/2);
  t = new Tektite(20,20, height/2, width/2 + 35);
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
  h.display();
  t.display();
  
  
}


    
