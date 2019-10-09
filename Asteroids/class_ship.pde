class Ship extends GameObject {
 //1. Instance variables

 PVector direction;

 
 //2. Constructors
 Ship() {
   super();
   lives = 3;
   location = new PVector(width/2, height/2);
   velocity = new PVector(0, 0); 
   direction = new PVector(0, -.1);
 }
 
 //3. Behavior functions
 void show() {
   pushMatrix();
   translate(location.x, location.y);
   rotate(direction.heading());
   image(shipimg, 0, 0, 150, 150);
   popMatrix();
 }
 
 void act() {
   super.act();
   if(upkey) velocity.add(direction);
   if(downkey) velocity.sub(direction);
   if(leftkey) direction.rotate(-PI/36);
   if(rightkey) direction.rotate(PI/36);
   if(spacekey) myGameObjects.add(new Bullet());  
 }

}
