Hero h;
int coolDown;
ArrayList<Wall> ListOfWalls;
int roomX = 2;
int roomY = 5;
MovableWall movingWall;
ArrayList<ArrayList<ArrayList<LockedDoor>>> ListOfDoorsRooms;
ArrayList<LockedDoor> ListOfDoors;
ArrayList<ArrayList<ArrayList<Wall>>> ListOfRooms;
ArrayList<MovableWall> ListOfMovableWalls;
int[][] WallsInput = {{},
                      {0,0,0,1,0,2,0,3,0,4,0,5,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,5,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,9,3,10,4,0,4,1,4,9,4,10,5,0,5,1,5,9,5,10,6,0,6,1,/*6,5,*/6,9,6,10,7,0,7,1,7,4,7,6,7,9,7,10,8,0,8,1,8,3,8,7,8,9,8,10,9,0,9,1,9,4,9,6,9,9,9,10,10,0,10,1,10,5,10,9,10,10,11,0,11,1,11,9,11,10,12,0,12,1,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,6,15,7,15,8,15,9,15,10},
                      {0,0,0,1,0,2,0,3,0,4,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,3,3,4,3,5,3,6,3,7,3,9,3,10,4,0,4,1,4,3,4,7,4,9,4,10,5,0,5,1,5,3,5,5,5,7,5,9,5,10,6,0,6,1,6,5,6,9,6,10,7,0,7,1,7,5,8,0,8,1,8,5,9,0,9,1,9,5,9,9,9,10,10,0,10,1,10,3,10,5,10,7,10,9,10,10,11,0,11,1,11,3,11,7,11,9,11,10,12,0,12,1,12,3,12,4,12,5,12,6,12,7,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,5,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,5,15,6,15,7,15,8,15,9,15,10},
                      {},{},{},{},{},
                      {0,0,0,1,0,2,0,3,0,4,0,5,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,5,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,2,2,3,2,4,2,6,2,7,2,8,2,9,2,10,3,0,3,1,3,2,3,8,3,9,3,10,4,0,4,1,4,2,4,4,4,5,4,6,4,7,4,8,4,9,4,10,5,0,5,1,5,2,5,8,5,9,5,10,6,0,6,1,6,2,6,3,6,4,6,5,6,6,6,8,6,9,6,10,7,6,8,4,9,0,9,1,9,2,9,4,9,5,9,6,9,7,9,8,9,9,9,10,10,0,10,1,10,2,10,8,10,9,10,10,11,0,11,1,11,2,11,3,11,4,11,5,11,6,11,8,11,9,11,10,12,0,12,1,12,2,12,8,12,9,12,10,13,0,13,1,13,2,13,3,13,4,13,6,13,7,13,8,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,5,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,5,15,6,15,7,15,8,15,9,15,10},
                      {},
                      {0,0,0,1,0,2,0,3,0,4,0,5,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,5,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,9,3,10,4,0,4,1,4,9,4,10,5,0,5,1,5,9,5,10,6,0,6,1,6,9,6,10,7,0,7,1,8,0,8,1,9,0,9,1,9,2,9,8,9,9,9,10,10,0,10,1,10,2,10,8,10,9,10,10,11,0,11,1,11,2,11,3,11,7,11,8,11,9,11,10,12,0,12,1,12,2,12,3,12,4,12,6,12,7,12,8,12,9,12,10,13,0,13,1,13,2,13,3,13,4,13,6,13,7,13,8,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,6,15,7,15,8,15,9,15,10},
                      {0,0,0,1,0,2,0,3,0,4,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,3,3,4,3,5,3,6,3,7,3,9,3,10,4,0,4,1,4,3,4,7,4,9,4,10,5,0,5,1,5,3,5,7,5,9,5,10,6,0,6,1,6,3,6,7,6,9,6,10,7,0,7,1,7,3,7,9,7,10,8,0,8,1,8,3,8,9,8,10,9,0,9,1,9,3,9,7,9,9,9,10,10,0,10,1,10,3,10,7,10,9,10,10,11,0,11,1,11,3,11,7,11,9,11,10,12,0,12,1,12,3,12,4,12,5,12,6,12,7,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,3,14,4,14,5,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,5,15,6,15,7,15,8,15,9,15,10},
                      {0,0,0,1,0,2,0,3,0,4,0,5,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,5,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,9,3,10,4,0,4,1,4,9,4,10,5,0,5,1,5,9,5,10,6,0,6,1,6,9,6,10,7,0,7,1,7,9,7,10,8,0,8,1,8,9,8,10,9,0,9,1,9,9,9,10,10,0,10,1,10,9,10,10,11,0,11,1,11,9,11,10,12,0,12,1,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,6,15,7,15,8,15,9,15,10},
                      {0,0,0,1,0,2,0,3,0,4,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,9,3,10,4,0,4,1,4,9,4,10,5,0,5,1,5,9,5,10,6,0,6,1,6,9,6,10,7,0,7,1,/*7,5,*/8,0,8,1,9,0,9,1,9,9,9,10,10,0,10,1,10,9,10,10,11,0,11,1,11,9,11,10,12,0,12,1,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,6,15,7,15,8,15,9,15,10},
                      {0,0,0,1,0,2,0,3,0,4,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,3,3,7,3,9,3,10,4,0,4,1,4,3,4,7,4,9,4,10,5,0,5,1,5,9,5,10,6,0,6,1,6,9,6,10,7,5,7,9,7,10,8,5,8,9,8,10,9,0,9,1,9,9,9,10,10,0,10,1,10,9,10,10,11,0,11,1,11,3,11,7,11,9,11,10,12,0,12,1,12,3,12,7,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,6,15,7,15,8,15,9,15,10},
                      {0,0,0,1,0,2,0,3,0,4,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,9,3,10,4,0,4,1,4,4,4,6,4,9,4,10,5,0,5,1,5,9,5,10,6,0,6,1,6,9,6,10,7,0,7,1,7,9,7,10,8,0,8,1,8,9,8,10,9,0,9,1,9,9,9,10,10,0,10,1,10,9,10,10,11,0,11,1,11,4,11,6,11,9,11,10,12,0,12,1,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,6,15,7,15,8,15,9,15,10},
                      {0,0,0,1,0,2,0,3,0,4,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,3,3,5,3,7,3,9,3,10,4,0,4,1,4,9,4,10,5,0,5,1,5,3,5,5,5,7,5,9,5,10,6,0,6,1,6,9,6,10,7,3,7,5,7,7,7,9,7,10,8,3,8,5,8,7,8,9,8,10,9,0,9,1,9,9,9,10,10,0,10,1,10,3,10,5,10,7,10,9,10,10,11,0,11,1,11,9,11,10,12,0,12,1,12,3,12,5,12,7,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,5,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,4,15,5,15,6,15,7,15,8,15,9,15,10},
                      {},{},
                      {0,0,0,1,0,2,0,3,0,4,0,5,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,5,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,9,3,10,4,0,4,1,4,9,4,10,5,0,5,1,5,9,5,10,6,0,6,1,6,9,6,10,7,4,7,5,7,6,7,9,7,10,8,4,8,5,8,6,8,9,8,10,9,0,9,1,9,9,9,10,10,0,10,1,10,9,10,10,11,0,11,1,11,9,11,10,12,0,12,1,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,6,15,7,15,8,15,9,15,10},
                      {0,0,0,1,0,2,0,3,0,4,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,9,3,10,4,0,4,1,4,4,4,6,4,9,4,10,5,0,5,1,5,9,5,10,6,0,6,1,6,9,6,10,7,0,7,1,8,0,8,1,9,0,9,1,9,9,9,10,10,0,10,1,10,9,10,10,11,0,11,1,11,4,11,6,11,9,11,10,12,0,12,1,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,6,15,7,15,8,15,9,15,10},
                      {0,0,0,1,0,2,0,3,0,4,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,9,3,10,4,0,4,1,4,3,4,7,4,9,4,10,5,0,5,1,5,9,5,10,6,0,6,1,6,9,6,10,7,0,7,1,7,9,7,10,8,0,8,1,8,9,8,10,9,0,9,1,9,9,9,10,10,0,10,1,10,9,10,10,11,0,11,1,11,3,11,7,11,9,11,10,12,0,12,1,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,5,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,5,15,6,15,7,15,8,15,9,15,10},
                      {},{},{},{},
                      {0,0,0,1,0,2,0,3,0,4,0,5,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,5,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,9,3,10,4,0,4,1,4,9,4,10,5,0,5,1,5,9,5,10,6,0,6,1,6,9,6,10,7,4,7,5,7,6,8,4,8,5,8,6,9,0,9,1,9,9,9,10,10,0,10,1,10,9,10,10,11,0,11,1,11,9,11,10,12,0,12,1,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,5,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,5,15,6,15,7,15,8,15,9,15,10},
                      {},{},{},{},
                      {0,0,0,1,0,2,0,3,0,4,0,5,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,5,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,9,3,10,4,0,4,1,4,9,4,10,5,0,5,1,5,9,5,10,6,0,6,1,6,9,6,10,7,0,7,1,7,9,7,10,8,0,8,1,8,9,8,10,9,0,9,1,9,9,9,10,10,0,10,1,10,9,10,10,11,0,11,1,11,9,11,10,12,0,12,1,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,6,15,7,15,8,15,9,15,10},
                      {0,0,0,1,0,2,0,3,0,4,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,3,3,5,3,7,3,9,3,10,4,0,4,1,4,9,4,10,5,0,5,1,5,9,5,10,6,0,6,1,6,3,6,5,6,7,6,9,6,10,7,10,8,10,9,0,9,1,9,3,9,5,9,7,9,9,9,10,10,0,10,1,10,9,10,10,11,0,11,1,11,9,11,10,12,0,12,1,12,3,12,5,12,7,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,6,15,7,15,8,15,9,15,10},
                      {0,0,0,1,0,2,0,3,0,4,0,6,0,7,0,8,0,9,0,10,1,0,1,1,1,2,1,3,1,4,1,6,1,7,1,8,1,9,1,10,2,0,2,1,2,9,2,10,3,0,3,1,3,9,3,10,4,0,4,1,4,4,4,5,4,6,4,9,4,10,5,0,5,1,5,4,5,5,5,6,5,9,5,10,6,0,6,1,6,9,6,10,7,0,7,1,7,9,7,10,8,0,8,1,8,9,8,10,9,0,9,1,9,9,9,10,10,0,10,1,10,4,10,5,10,6,10,9,10,10,11,0,11,1,11,4,11,5,11,6,11,9,11,10,12,0,12,1,12,9,12,10,13,0,13,1,13,9,13,10,14,0,14,1,14,2,14,3,14,4,14,5,14,6,14,7,14,8,14,9,14,10,15,0,15,1,15,2,15,3,15,4,15,5,15,6,15,7,15,8,15,9,15,10},
                      {},{}};
                      
int[][] MovableWallsInput = {{},{6,5},{},{},{},{},{},{},{},{},{},{},{},{7,5},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}};


int[][] LockedDoorsInput = {{},{},{1,5},{},{},{},{},{},{7,1,8,1},{},{},{},{},{},{14,5},{},{7,1,8,1},{},{},{7,1,8,1},{},{},{},{},{},{},{},{},{},{},{},{},{7,1,8,1},{},{},{}};

void setup() {
  size(768,528);
  background(255);
  rectMode(CENTER);
  h = new Hero(48,48,width/2-24,height - 72);
  coolDown = 0;
  ListOfWalls = new ArrayList<Wall>();
  ListOfMovableWalls = new ArrayList<MovableWall>();
  ListOfDoors = new ArrayList<LockedDoor>();
  //int a = (int)(random(11));
  //for (int i = 0;i < a;i += 1) {
  //  Wall 
  ListOfRooms = new ArrayList<ArrayList<ArrayList<Wall>>>();
  ListOfDoorsRooms = new ArrayList<ArrayList<ArrayList<LockedDoor>>>();
  for (int i = 0;i < 6;i += 1) {
    ListOfRooms.add(new ArrayList<ArrayList<Wall>>());
    ListOfDoorsRooms.add(new ArrayList<ArrayList<LockedDoor>>());
    for (int j = 0;j < 6;j += 1) {
      ListOfRooms.get(i).add(new ArrayList<Wall>());
      ListOfDoorsRooms.get(i).add(new ArrayList<LockedDoor>());
    }
  }
  for (int i = 0;i < ListOfRooms.size();i += 1) {
    for (int j = 0;j < ListOfRooms.get(i).size();j += 1) {
      for (int k = 0;k < WallsInput[i*6 + j].length;k += 2) {
        ListOfRooms.get(i).get(j).add(new Wall(WallsInput[i*6 + j][k],WallsInput[i*6 + j][k+1]));
      }
      for (int k = 0;k < LockedDoorsInput[i*6+j].length;k += 2) {
        ListOfDoorsRooms.get(i).get(j).add(new LockedDoor(LockedDoorsInput[i*6+j][k],LockedDoorsInput[i*6+j][k+1]));
      }
    }
  }

  //w = new Wall(3,3);
  //ListOfWalls.add(w);
}

void draw() {
  ListOfWalls = ListOfRooms.get(roomY).get(roomX);
  ListOfDoors = ListOfDoorsRooms.get(roomY).get(roomX);
  //ListOfMovableWalls = MovableRoomsList.get(roomY).get(roomX);
  background(255);
  //fill(255,0,0);
  //rect(72,72,144,144);
  for (Wall w : ListOfWalls) {
    w.display();
  }
  for (MovableWall w : ListOfMovableWalls) {
    w.display();
  }
  if (coolDown > 0) {
    coolDown -= 1;
    h.x += h.slowMoveX;
    h.y += h.slowMoveY;
  }
  for (LockedDoor d : ListOfDoors) {
    d.display();
  }
  if (movingWall != null && movingWall.coolDown > 0) {
    movingWall.coolDown -= 1;
    movingWall.changeXCor(movingWall.slowMoveX);
    movingWall.changeYCor(movingWall.slowMoveY);
    if (movingWall.coolDown == 0) {
      movingWall = null;
    }
  }

  h.move();
  h.attack();
  h.display();
}



public class Hero implements Fightable{
  int Imgh,Imgw,x,y,hp,dmg,slowMoveX,slowMoveY,keys;
  char direction;
  Hero(int he,int wi,int startx,int starty) {
    Imgh = he;
    Imgw = wi;
    x = startx;
    y = starty;
    hp = 100;
    dmg = 10;
    direction = 'd';
    keys = 0;
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
        ListOfMovableWalls.add(new MovableWall(MovableWallsInput[roomY*6+roomX][0],MovableWallsInput[roomY*6+roomX][1]));
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
        ListOfMovableWalls.add(new MovableWall(MovableWallsInput[roomY*6+roomX][0],MovableWallsInput[roomY*6+roomX][1]));
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
        ListOfMovableWalls.add(new MovableWall(MovableWallsInput[roomY*6+roomX][0],MovableWallsInput[roomY*6+roomX][1]));
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
        ListOfMovableWalls.add(new MovableWall(MovableWallsInput[roomY*6+roomX][0],MovableWallsInput[roomY*6+roomX][1]));
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

public class MovableWall /*extends Wall*/{ 
  float x,y;
  float slowMoveX,slowMoveY;
  int coolDown;
  
  
  MovableWall(int xCor,int yCor) {
    //super(xCor,yCor);
    x = xCor;
    y = yCor;
  }
  
  void changeXCor(float delta) {
    x += delta;
  }
  
  void changeYCor(float delta) {
    y += delta;
  }
  
  void display() {
    fill(0,0,255);
    rect(48*x+24,48*y+24,48,48);
  }
  
  
}

public class LockedDoor{
  int x,y;
  boolean isLocked;
  
  public LockedDoor(int xCor,int yCor) {
    x = xCor;
    y = yCor;
    isLocked = true;
  }
  
  public void unlock() {
    isLocked = false;
  }
  
  public void display() {
    fill(127,0,127);
    rect(48*x+24,48*y+24,48,48);
  }
}