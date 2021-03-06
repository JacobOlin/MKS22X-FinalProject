int coolDown;
Hero hero;
Enemies u, d, l, r;
ArrayList<Enemies> Enemies;
ArrayList<Fireball> Fireballs;
ArrayList<Arrow> Arrows;
ArrayList<Wall> ListOfWalls;
int roomX = 2;
int roomY = 5;
PImage gameover; 
PImage bricks;
PImage bowImage;
PImage triforceImage;
PImage victory;
MovableWall movingWall;
PImage[][] backgrounds = new PImage[6][6];
ArrayList<ArrayList<ArrayList<LockedDoor>>> ListOfDoorsRooms;
ArrayList<LockedDoor> ListOfDoors;
ArrayList<ArrayList<ArrayList<Wall>>> ListOfRooms;
ArrayList<MovableWall> ListOfMovableWalls;
PImage tile,movablewall;
int[] keyList = {0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0};
key curr;
Bow bow = new Bow();
Triforce triforce = new Triforce();
boolean canShoot = false;
boolean won = false;


int[][] WallsInput = {{}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 9, 3, 10, 4, 0, 4, 1, 4, 9, 4, 10, 5, 0, 5, 1, 5, 9, 5, 10, 6, 0, 6, 1, /*6,5,*/6, 9, 6, 10, 7, 0, 7, 1, 7, 4, 7, 6, 7, 9, 7, 10, 8, 0, 8, 1, 8, 3, 8, 7, 8, 9, 8, 10, 9, 0, 9, 1, 9, 4, 9, 6, 9, 9, 9, 10, 10, 0, 10, 1, 10, 5, 10, 9, 10, 10, 11, 0, 11, 1, 11, 9, 11, 10, 12, 0, 12, 1, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 3, 3, 4, 3, 5, 3, 6, 3, 7, 3, 9, 3, 10, 4, 0, 4, 1, 4, 3, 4, 7, 4, 9, 4, 10, 5, 0, 5, 1, 5, 3, 5, 5, 5, 7, 5, 9, 5, 10, 6, 0, 6, 1, 6, 5, 6, 9, 6, 10, 7, 0, 7, 1, 7, 5, 8, 0, 8, 1, 8, 5, 9, 0, 9, 1, 9, 5, 9, 9, 9, 10, 10, 0, 10, 1, 10, 3, 10, 5, 10, 7, 10, 9, 10, 10, 11, 0, 11, 1, 11, 3, 11, 7, 11, 9, 11, 10, 12, 0, 12, 1, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 5, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 5, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {}, {}, {}, {}, {}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 2, 2, 3, 2, 4, 2, 6, 2, 7, 2, 8, 2, 9, 2, 10, 3, 0, 3, 1, 3, 2, 3, 8, 3, 9, 3, 10, 4, 0, 4, 1, 4, 2, 4, 4, 4, 5, 4, 6, 4, 7, 4, 8, 4, 9, 4, 10, 5, 0, 5, 1, 5, 2, 5, 8, 5, 9, 5, 10, 6, 0, 6, 1, 6, 2, 6, 3, 6, 4, 6, 5, 6, 6, 6, 8, 6, 9, 6, 10, 7, 6, 8, 4, 9, 0, 9, 1, 9, 2, 9, 4, 9, 5, 9, 6, 9, 7, 9, 8, 9, 9, 9, 10, 10, 0, 10, 1, 10, 2, 10, 8, 10, 9, 10, 10, 11, 0, 11, 1, 11, 2, 11, 3, 11, 4, 11, 5, 11, 6, 11, 8, 11, 9, 11, 10, 12, 0, 12, 1, 12, 2, 12, 8, 12, 9, 12, 10, 13, 0, 13, 1, 13, 2, 13, 3, 13, 4, 13, 6, 13, 7, 13, 8, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 5, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 5, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 9, 3, 10, 4, 0, 4, 1, 4, 9, 4, 10, 5, 0, 5, 1, 5, 9, 5, 10, 6, 0, 6, 1, 6, 9, 6, 10, 7, 0, 7, 1, 8, 0, 8, 1, 9, 0, 9, 1, 9, 2, 9, 8, 9, 9, 9, 10, 10, 0, 10, 1, 10, 2, 10, 8, 10, 9, 10, 10, 11, 0, 11, 1, 11, 2, 11, 3, 11, 7, 11, 8, 11, 9, 11, 10, 12, 0, 12, 1, 12, 2, 12, 3, 12, 4, 12, 6, 12, 7, 12, 8, 12, 9, 12, 10, 13, 0, 13, 1, 13, 2, 13, 3, 13, 4, 13, 6, 13, 7, 13, 8, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 3, 3, 4, 3, 5, 3, 6, 3, 7, 3, 9, 3, 10, 4, 0, 4, 1, 4, 3, 4, 7, 4, 9, 4, 10, 5, 0, 5, 1, 5, 3, 5, 7, 5, 9, 5, 10, 6, 0, 6, 1, 6, 3, 6, 7, 6, 9, 6, 10, 7, 0, 7, 1, 7, 3, 7, 9, 7, 10, 8, 0, 8, 1, 8, 3, 8, 9, 8, 10, 9, 0, 9, 1, 9, 3, 9, 7, 9, 9, 9, 10, 10, 0, 10, 1, 10, 3, 10, 7, 10, 9, 10, 10, 11, 0, 11, 1, 11, 3, 11, 7, 11, 9, 11, 10, 12, 0, 12, 1, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 3, 14, 4, 14, 5, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 5, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 9, 3, 10, 4, 0, 4, 1, 4, 9, 4, 10, 5, 0, 5, 1, 5, 9, 5, 10, 6, 0, 6, 1, 6, 9, 6, 10, 7, 0, 7, 1, 7, 9, 7, 10, 8, 0, 8, 1, 8, 9, 8, 10, 9, 0, 9, 1, 9, 9, 9, 10, 10, 0, 10, 1, 10, 9, 10, 10, 11, 0, 11, 1, 11, 9, 11, 10, 12, 0, 12, 1, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 9, 3, 10, 4, 0, 4, 1, 4, 9, 4, 10, 5, 0, 5, 1, 5, 9, 5, 10, 6, 0, 6, 1, 6, 9, 6, 10, 7, 0, 7, 1, /*7,5,*/8, 0, 8, 1, 9, 0, 9, 1, 9, 9, 9, 10, 10, 0, 10, 1, 10, 9, 10, 10, 11, 0, 11, 1, 11, 9, 11, 10, 12, 0, 12, 1, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 3, 3, 7, 3, 9, 3, 10, 4, 0, 4, 1, 4, 3, 4, 7, 4, 9, 4, 10, 5, 0, 5, 1, 5, 9, 5, 10, 6, 0, 6, 1, 6, 9, 6, 10, 7, 5, 7, 9, 7, 10, 8, 5, 8, 9, 8, 10, 9, 0, 9, 1, 9, 9, 9, 10, 10, 0, 10, 1, 10, 9, 10, 10, 11, 0, 11, 1, 11, 3, 11, 7, 11, 9, 11, 10, 12, 0, 12, 1, 12, 3, 12, 7, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 9, 3, 10, 4, 0, 4, 1, 4, 4, 4, 6, 4, 9, 4, 10, 5, 0, 5, 1, 5, 9, 5, 10, 6, 0, 6, 1, 6, 9, 6, 10, 7, 0, 7, 1, 7, 9, 7, 10, 8, 0, 8, 1, 8, 9, 8, 10, 9, 0, 9, 1, 9, 9, 9, 10, 10, 0, 10, 1, 10, 9, 10, 10, 11, 0, 11, 1, 11, 4, 11, 6, 11, 9, 11, 10, 12, 0, 12, 1, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 3, 3, 5, 3, 7, 3, 9, 3, 10, 4, 0, 4, 1, 4, 9, 4, 10, 5, 0, 5, 1, 5, 3, 5, 5, 5, 7, 5, 9, 5, 10, 6, 0, 6, 1, 6, 9, 6, 10, 7, 3, 7, 5, 7, 7, 7, 9, 7, 10, 8, 3, 8, 5, 8, 7, 8, 9, 8, 10, 9, 0, 9, 1, 9, 9, 9, 10, 10, 0, 10, 1, 10, 3, 10, 5, 10, 7, 10, 9, 10, 10, 11, 0, 11, 1, 11, 9, 11, 10, 12, 0, 12, 1, 12, 3, 12, 5, 12, 7, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 5, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 4, 15, 5, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {}, {}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 9, 3, 10, 4, 0, 4, 1, 4, 9, 4, 10, 5, 0, 5, 1, 5, 9, 5, 10, 6, 0, 6, 1, 6, 9, 6, 10, 7, 4, 7, 5, 7, 6, 7, 9, 7, 10, 8, 4, 8, 5, 8, 6, 8, 9, 8, 10, 9, 0, 9, 1, 9, 9, 9, 10, 10, 0, 10, 1, 10, 9, 10, 10, 11, 0, 11, 1, 11, 9, 11, 10, 12, 0, 12, 1, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 9, 3, 10, 4, 0, 4, 1, 4, 4, 4, 6, 4, 9, 4, 10, 5, 0, 5, 1, 5, 9, 5, 10, 6, 0, 6, 1, 6, 9, 6, 10, 7, 0, 7, 1, 8, 0, 8, 1, 9, 0, 9, 1, 9, 9, 9, 10, 10, 0, 10, 1, 10, 9, 10, 10, 11, 0, 11, 1, 11, 4, 11, 6, 11, 9, 11, 10, 12, 0, 12, 1, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 9, 3, 10, 4, 0, 4, 1, 4, 3, 4, 7, 4, 9, 4, 10, 5, 0, 5, 1, 5, 9, 5, 10, 6, 0, 6, 1, 6, 9, 6, 10, 7, 0, 7, 1, 7, 9, 7, 10, 8, 0, 8, 1, 8, 9, 8, 10, 9, 0, 9, 1, 9, 9, 9, 10, 10, 0, 10, 1, 10, 9, 10, 10, 11, 0, 11, 1, 11, 3, 11, 7, 11, 9, 11, 10, 12, 0, 12, 1, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 5, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 5, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {}, {}, {}, {}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 9, 3, 10, 4, 0, 4, 1, 4, 9, 4, 10, 5, 0, 5, 1, 5, 9, 5, 10, 6, 0, 6, 1, 6, 9, 6, 10, 7, 4, 7, 5, 7, 6, 8, 4, 8, 5, 8, 6, 9, 0, 9, 1, 9, 9, 9, 10, 10, 0, 10, 1, 10, 9, 10, 10, 11, 0, 11, 1, 11, 9, 11, 10, 12, 0, 12, 1, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 5, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 5, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {}, {}, {}, {}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 9, 3, 10, 4, 0, 4, 1, 4, 9, 4, 10, 5, 0, 5, 1, 5, 9, 5, 10, 6, 0, 6, 1, 6, 9, 6, 10, 7, 0, 7, 1, 7, 9, 7, 10, 8, 0, 8, 1, 8, 9, 8, 10, 9, 0, 9, 1, 9, 9, 9, 10, 10, 0, 10, 1, 10, 9, 10, 10, 11, 0, 11, 1, 11, 9, 11, 10, 12, 0, 12, 1, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 3, 3, 5, 3, 7, 3, 9, 3, 10, 4, 0, 4, 1, 4, 9, 4, 10, 5, 0, 5, 1, 5, 9, 5, 10, 6, 0, 6, 1, 6, 3, 6, 5, 6, 7, 6, 9, 6, 10, 7, 10, 8, 10, 9, 0, 9, 1, 9, 3, 9, 5, 9, 7, 9, 9, 9, 10, 10, 0, 10, 1, 10, 9, 10, 10, 11, 0, 11, 1, 11, 9, 11, 10, 12, 0, 12, 1, 12, 3, 12, 5, 12, 7, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {0, 0, 0, 1, 0, 2, 0, 3, 0, 4, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 2, 0, 2, 1, 2, 9, 2, 10, 3, 0, 3, 1, 3, 9, 3, 10, 4, 0, 4, 1, 4, 4, 4, 5, 4, 6, 4, 9, 4, 10, 5, 0, 5, 1, 5, 4, 5, 5, 5, 6, 5, 9, 5, 10, 6, 0, 6, 1, 6, 9, 6, 10, 7, 0, 7, 1, 7, 9, 7, 10, 8, 0, 8, 1, 8, 9, 8, 10, 9, 0, 9, 1, 9, 9, 9, 10, 10, 0, 10, 1, 10, 4, 10, 5, 10, 6, 10, 9, 10, 10, 11, 0, 11, 1, 11, 4, 11, 5, 11, 6, 11, 9, 11, 10, 12, 0, 12, 1, 12, 9, 12, 10, 13, 0, 13, 1, 13, 9, 13, 10, 14, 0, 14, 1, 14, 2, 14, 3, 14, 4, 14, 5, 14, 6, 14, 7, 14, 8, 14, 9, 14, 10, 15, 0, 15, 1, 15, 2, 15, 3, 15, 4, 15, 5, 15, 6, 15, 7, 15, 8, 15, 9, 15, 10}, 
  {}, {}};

int[][] MovableWallsInput = {{}, {6, 5}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {7, 5}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}};

int[][] LockedDoorsInput = {{}, {}, {/*1, 5*/}, {}, {}, {}, {}, {}, {/*7, 1, 8, 1*/}, {}, {}, {}, {}, {}, {14, 5}, {}, {7, 1, 8, 1}, {}, {}, {7, 1, 8, 1}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {7, 1, 8, 1}, {}, {}, {}};

void setup() {
  size(768, 528);
  background(255);
  rectMode(CENTER);
  Enemies = new ArrayList<Enemies>();
  Fireballs = new ArrayList<Fireball>();
  Arrows = new ArrayList<Arrow>();
  //d = new Tektite(48, 48, width/2 -24, height - 72);
  //u = new Aquamentus(48, 48, width/2-24, height - 72);
  //l = new Peahat(48, 48, width/2-24, height -72);
  //Fireball f = new Fireball(20, 20, 1, 1);
  ///Enemies.add(d);
  //Enemies.add(u);
  //Enemies.add(l);
  //Fireballs.add(f);
  tile = loadImage("tile.png");
  movablewall = loadImage("movableWall.png");
  gameover = loadImage("gameover.png");
  bricks = loadImage("bricks.png");
  bowImage = loadImage("bow.png");
  triforceImage = loadImage("triforce.png");
  victory = loadImage("VictoryScreen.png");
  hero = new Hero(48, 48, width/2 + 24, height - 72);
  coolDown = 0;
  ListOfWalls = new ArrayList<Wall>();
  ListOfMovableWalls = new ArrayList<MovableWall>();
  ListOfDoors = new ArrayList<LockedDoor>();
  //int a = (int)(random(11));
  //for (int i = 0;i < a;i += 1) {
  //  Wall 
  ListOfRooms = new ArrayList<ArrayList<ArrayList<Wall>>>();
  ListOfDoorsRooms = new ArrayList<ArrayList<ArrayList<LockedDoor>>>();
  for (int i = 0; i < 6; i += 1) {
    ListOfRooms.add(new ArrayList<ArrayList<Wall>>());
    ListOfDoorsRooms.add(new ArrayList<ArrayList<LockedDoor>>());
    for (int j = 0; j < 6; j += 1) {
      ListOfRooms.get(i).add(new ArrayList<Wall>());
      ListOfDoorsRooms.get(i).add(new ArrayList<LockedDoor>());
      if (WallsInput[i*6+j].length > 0) {
        backgrounds[i][j] = loadImage("Map" + i + "" + j + ".png");
      }
    }
  }
  for (int i = 0; i < ListOfRooms.size(); i += 1) {
    for (int j = 0; j < ListOfRooms.get(i).size(); j += 1) {
      for (int k = 0; k < WallsInput[i*6 + j].length; k += 2) {
        ListOfRooms.get(i).get(j).add(new Wall(WallsInput[i*6 + j][k], WallsInput[i*6 + j][k+1]));
      }
      for (int k = 0; k < LockedDoorsInput[i*6+j].length; k += 2) {
        ListOfDoorsRooms.get(i).get(j).add(new LockedDoor(LockedDoorsInput[i*6+j][k], LockedDoorsInput[i*6+j][k+1]));
      }
    }
  }

  //w = new Wall(3,3);
  //ListOfWalls.add(w);
}

void draw() {
  if ( hero.hp <= 0 || won) {
    if (won) {
      image(victory,0,0,width,height);
    }else {
      image(gameover, 0, 0, width, height);
    }
    if (key == 'X' || key == 'x') {
      setup();
      changeEnemies();
    }
  } else {
    //println(hero.hp);
    ListOfWalls = ListOfRooms.get(roomY).get(roomX);
    ListOfDoors = ListOfDoorsRooms.get(roomY).get(roomX);
    //background(255);
    image(backgrounds[roomY][roomX], 0, 0, width, height-24);
    image(bricks, 0, height - 24, width, 120);
    //fill(255,0,0);
    //rect(72,72,144,144);
    //for (Wall w : ListOfWalls) {
    //w.display();
    //}
    if (roomX == 1) {
      if (roomY == 0) {
        image(tile,48*6,5*48,48,48);
      }
      if (roomY == 2) {
        image(tile,48*7,5*48,48,48);
      }
    }
    for (MovableWall w : ListOfMovableWalls) {
      w.display();
    }
    if (coolDown > 0) {
      coolDown -= 1;
      hero.x += hero.slowMoveX;
      hero.y += hero.slowMoveY;
    }
    if (movingWall != null && movingWall.coolDown > 0) {
      movingWall.coolDown -= 1;
      movingWall.changeXCor(movingWall.slowMoveX);
      movingWall.changeYCor(movingWall.slowMoveY);
      if (movingWall.coolDown == 0) {
        movingWall = null;
      }
    }
    if (curr != null) {
      curr.display();
      if (abs(curr.x - hero.x) < 36 && abs(curr.y - hero.y) < 36) {
        curr = null;
        hero.keys += 1;
      }
    }
    if (roomY == 0 && roomX == 1 && bow != null) {
      bow.display();
      if (abs(hero.x - 9*48) <= 24 && abs(hero.y - 5*48) <= 24) {
        canShoot = true;
        bow = null;
      }
    }
    if (roomY == 1 && roomX == 5) {
      triforce.display();
      if (abs(hero.x - 8*48) <= 24 && abs(hero.y - 5*48) <= 24) {
        won = true;
      }
    }
      
    fill(0, 0, 0);
    textSize(25);
    if (canShoot) {
      text("Arrows : " + hero.arrows, 30, 80);
    }
    text("Health : " + hero.hp, 30, 30);
    text("Keys : " + hero.keys,30,55);
    hero.move();
    hero.attack();
    if (canShoot) {
      hero.bow();
    }
    hero.display();
    showEnemies(); // displays all the Enemies
    die();         // checks the list of enemies and removes them if they need to die
    moveEnemies();
    enemiesAttack();
  }
}

void die() {
  for ( int i = 0; i < Enemies.size(); i++) {
    if (Enemies.get(i).die()) {
      if (keyList[roomY*6+roomX] > 0) {
        keyList[roomY*6+roomX] -= 1;
        dropKey(Enemies.get(i).x,Enemies.get(i).y);
      }
      Enemies.remove(i);
      i--;
    }
  }
  for ( int i = 0; i < Fireballs.size(); i++) {
    if ( Fireballs.get(i).time > 0) {
      Fireballs.get(i).time -= 1;
    } else {
      Fireballs.remove(i);
      i--;
    }
  }
  for ( int i = 0; i < Arrows.size(); i++) {
    if ( Arrows.get(i).time > 0) {
      Arrows.get(i).time -= 1;
    } else {
      Arrows.remove(i);
      i--;
    }
  }
}

void showEnemies() {
  for ( int i = 0; i < Enemies.size(); i++) {
    Enemies.get(i).display();
  }
  for (int i = 0; i < Fireballs.size(); i++) {
    Fireballs.get(i).display();
  }
  for (int i = 0; i < Arrows.size(); i++) {
    Arrows.get(i).display();
  }
}


void moveEnemies() {
  for ( int i =0; i < Enemies.size(); i++) {
    Enemies.get(i).move();
  }
  for ( int i = 0; i < Fireballs.size(); i++) {
    Fireballs.get(i).move();
  }
  for ( int i = 0; i < Arrows.size(); i++) {
    Arrows.get(i).move();
  }
}

void enemiesAttack() {
  for ( int i = 0; i < Enemies.size(); i++) {
    Enemies.get(i).attack();
  }
  for ( int i = 0; i < Fireballs.size(); i++) {
    Fireballs.get(i).collide();
  }
  for ( int i = 0; i < Arrows.size(); i++) {
    Arrows.get(i).collide();
  }
}

void changeEnemies() {
  //println("called");
  //println("roomX : " + roomX);
  //println("roomY : " + roomY);
  Enemies.clear();
  Fireballs.clear();
  Arrows.clear();
  if ( roomX == 1 && roomY == 5) {
    Enemies.add(new Tektite(48, 48, width /2 - 24, height  /2 ));
    Enemies.add(new Tektite(48, 48, width /2 + 24, height / 2 +  48));
    Enemies.add(new Tektite(48, 48, 192, height /2 - 48 ));
  }
  if ( roomX == 3 && roomY == 5) {
    Enemies.add(new Peahat(48, 48, width /2 + 24, height /2 + 48));
    Enemies.add(new Peahat(48, 48, width /2 + 24, height /2 - 48));
    Enemies.add(new Tektite(48, 48, 624, height /2));
  }
  if ( roomX == 2 && roomY == 4) {
    Enemies.add(new Tektite(48, 48, width /2 - 72, height /2 + 48));
    Enemies.add(new Peahat(48, 48, width /2 - 120, height /2 - 48));
    Enemies.add(new Tektite(48, 48, width /2 -  216, height /2));
    
  }
  if ( roomX == 2 && roomY == 3) {
    Enemies.add(new Tektite(48, 48, width /2 - 24, height /2 + 48));
    Enemies.add(new Peahat(48, 48, width /2 - 24, height /2 - 48));
    Enemies.add(new Tektite(48, 48, width /2 -  168, height /2));
    Enemies.add(new Tektite(48, 48, width /2  + 168, height /2 + 48));
    Enemies.add(new Tektite(48, 48, width /2 -  216, height /2));
  }
  if ( roomX == 1 && roomY ==3) {
    Enemies.add(new Peahat(48, 48, 240 /2 + 24, height /2 + 48));
    Enemies.add(new Peahat(48, 48, 288, height /2 - 48));
    Enemies.add(new Tektite(48, 48, 240, height /2));
  }
  if ( roomX == 3 && roomY == 3) {
    Enemies.add(new Tektite(48, 48, width /2 - 24, height /2 + 48));
    Enemies.add(new Peahat(48, 48, width /2 - 24, height /2 - 48));
    Enemies.add(new Peahat(48, 48, width /2 -  168, height /2));
    Enemies.add(new Peahat(48, 48, width /2  + 168, height /2 + 48));
    Enemies.add(new Tektite(48, 48, width /2 -  216, height /2));
  }
  if ( roomX == 4 && roomY ==2) {
    Enemies.add(new Peahat(48, 48, 624, height /2 + 48));
    Enemies.add(new Peahat(48, 48, 624, height /2 - 48));
  }
  if ( roomX == 1 && roomY == 2) {
    Enemies.add(new Peahat(48, 48, width /2 - 24, height /2 + 48));
    Enemies.add(new Peahat(48, 48, width /2 - 24, height /2 - 48));
    Enemies.add(new Tektite(48, 48, width /2 -  168, height /2));
    Enemies.add(new Peahat(48, 48, width /2  + 168, height /2 + 48));
    Enemies.add(new Tektite(48, 48, width /2 -  216, height /2));
  }
  if ( roomX == 4 && roomY == 1) {
    Enemies.add(new Aquamentus(48, 48, 624, height /2));
  }
  if ( roomX == 2 && roomY == 0) {
    Enemies.add(new Tektite(48, 48, width/2-24, 144));
  }
}


public class LockedDoor {
  int x, y;
  boolean isLocked;

  public LockedDoor(int xCor, int yCor) {
    x = xCor;
    y = yCor;
    isLocked = true;
  }

  public void unlock() {
    isLocked = false;
    for (LockedDoor d : ListOfDoors) {
      if (abs(x - d.x) <= 1 && abs(y - d.y) <= 1 && d.isLocked) {
        d.unlock();
      }
    }
  }

  public void display() {
    fill(127, 0, 127);
    rect(48*x+24, 48*y+24, 48, 48);
  }
}

public void dropKey(int xcor,int ycor) {
  curr = new key(xcor,ycor);
}

public class key {
  int x,y;
  public key(int xcor,int ycor) {
    x = xcor;
    y = ycor;
  }
  
  public void display() {
    fill(255,255,0);
    rect(x,y,24,24);
  }
}

public class Bow {
  int x;
  int y;
  
  public Bow() {
    x = 8*48;
    y = 5*48;
  }
  public void display() {
    image(bowImage,x,y,48,48);
  }
}

public class Triforce {
  int x;
  int y;
  
  public Triforce() {
    x = 8*48;
    y = 5*48;
  }
  
  public void display() {
    image(triforceImage,x,y,48,48);
  }
}
