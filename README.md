# MKS22X-FinalProject

## Project description

For our Final Project, we recreated the first dungeon from the game, The Legend of Zelda. In this recreation, we made several enemey types, different ways to attack, the standard sword and the long range bow, and keeping with the rogue-like genre, multilple rooms to explore. To run our program, open the finalproject.pde file in processing and click run.

## Dev Log

5/20/19:<br/>
  Jacob- Started to work on allowing the player to move around. Also added a cool down on move so that the player doesn't move too quickly. Also created the class walls. They show up but don't do anything.<br/>
  Cody - Added the Fighttable interface and the basses for the Enemy classes
  
5/21/19:<br/>
  Jacob- Created the interface fightable so that we can later loop through a list of fightables and have each one attack. Also created a pseudo-attack for the hero based on the direction they were last moving. It only creates a red space but it's in the direction that is most logical.<br/>
  Cody - Worked on the Fireball class
  
5/22/19:<br/>
  Jacob- Worked on the map so that the player can now enter different rooms. Each room can have a different amount of walls in various places. Also did a quality of life update by making the player move more smoothly.<br/>
  
5/23/19:<br/>
  Jacob- Today I basically worked on creating the entire map. You can now smoothly move to any part of the map and the walls prevent you from doing anything you wouldn't normally be able to do.<br/>
  Cody - Gave Enemies x and y values and was proprely able to display them using a rectange(temporaray)
  
5/24/19:<br/>
  Jacob- Started working on making the Movable walls for the two locations in the map where you can actually push walls. The walls are giving me a bit of trouble but you can get the wall to move, it just doesn't look like it has moved.
  
5/28/19:<br/>
  Jacob- Today I got the movable walls to sort of work. You can push them but their movement is very clunky and they can be pushed into other walls.<br/>
  Cody - Changed the Hero class to be more intuative to use. Created the attack method for Hero which allowed you to attack. Created the Enemies array list to populate the Enemies. Created a way for Enemies to die, being removed from the list.
  
5/29/19:<br/>
  Jacob- I got the movable walls to work a lot nicer. They move really smoothly, they can no longer be pushed into other walls, and will act like regular walls when they're pushed up against other walls. The movable walls also reset when you exit and re-enter the room.<br/>
  Cody - Attack and dealDamage now works in every direction. Enemies now move around randomly.
  
5/30/19:<br/>
  Jacob-Updated the devLog today.<br/>
  Cody- Spent 40 minutes and probably 40000 brain cells trying to merge two branches, was succesful in the end. Messed around with the numbers for enemies moving to be more reasonsable
  
5/31/19:
  Jacob-I started working on the locked doors today, but I wasn't able to finish because I need some stuff from enemies.<br/>
  Cody- Enemies now don't walk through walls

6/1/19:<br/>
  Cody- Gave images to display the Enemies instead of the rectangles

6/2/19:<br/>
  Cody- Enemies now attack Link when he gets close. Fireballs now fly around, and dissapear after a certain amount of time. They also dissapear and deal damage to Link if they collide with him. Aquamentus now fires 3 fireballs as his attack along with the regular attack.

6/3/19:<br/>
  Jacob- I finished the locked doors today.<br/>
  Cody- Added a Gameover screen, but if you press x on this screen you respawn
  
6/4/19:<br/>
  Jacob- Finished up a lot of last minute stuff. I created keys, which are dropped by enemies and allow you to open doors, made it so that you can only get the bow at a certain point, and made a definitive end to the game.<br/>
  Cody- Added the bow for Link. Added the Arrows class, which functions the same as fireballs, but instead colides with Enemies. Added a text display for Link's Arrows and Health. Added a fucntion to change the Enemies for the different rooms.
