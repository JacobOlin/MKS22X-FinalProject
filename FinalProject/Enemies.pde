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

public class Ocotorok extends Enemies{
 int x;
 int y;
 
 public Octorok(int xpos, int ypos){
   x = xpos;
   y=ypos;
   hp = 3;
   damage = 1;
 }
 
 public void move(){
 }
 
 public void attack(int damage){
 }
 
 public void takeDamage(int damage){
   hp -= damage;
 }
}
   