Spaceship ship = new Spaceship();
ArrayList<Asteroid> meteor;
Stars[] sky= new Stars[250];
ArrayList <Bullet> pewpew;
boolean start = false;
public void setup() 
{
  size(800,800);
  for (int i=0; i<sky.length; i++)
    sky[i] = new Stars();
  
  meteor = new ArrayList <Asteroid>();
  for (int i=0; i<10; i++)
  {
    Asteroid rock = new Asteroid();
    meteor.add(i,rock); 
  }
  pewpew = new ArrayList <Bullet>();
}
public void draw() 
{
  background(0);
  ship.show();
  ship.move();
  for (int i=0; i<sky.length; i++)
    sky[i].show();
  for (int i=0; i<meteor.size(); i++)
  {
    meteor.get(i).show();
    meteor.get(i).move();
    if (dist(meteor.get(i).getX(),meteor.get(i).getY(),ship.getX(),ship.getY())<40)
    {
      meteor.remove(i);
      i--;
    }
  }
  for (int i=0; i<pewpew.size(); i++)
  {
    pewpew.get(i).show();
    pewpew.get(i).move();
  }
  
}
public void keyPressed()
{
  if (key == 'w')
  {
      ship.accelerate(.3);
      start = true;
  }
    if (key == 'a')
  {
    //ship.setDirectionX(ship.getPointDirection());
    ship.turn(-10);
    start = true;
  }
    if (key == 's')
  {
     ship.accelerate(-.4);
     start = true;
  }
    if (key == 'd')
  {
    //ship.setPointDirection(ship.getPointDirection());
    ship.turn(10);
    start = true;
  }
  if (key == ' ')
  {
    Bullet bullets = new Bullet(ship);
    pewpew.add(bullets);
  }
  if (keyCode == 16)
  {
    ship.setX(((int)(Math.random()*780)+10));
    ship.setY(((int)(Math.random()*780)+10));
    ship.setDirectionX(0);
    ship.setDirectionY(0);
    ship.setPointDirection((int)(Math.random()*360));
  }
}