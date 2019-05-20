public abstract class Enemies implements Fightable{
  int hp;
  int damage;
  
  public abstract void move(){
  }
  
  public abstract void takeDamage(int damage){
  }
  
  public abstract void attack( int damage){
  }
}