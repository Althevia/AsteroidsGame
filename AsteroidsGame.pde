Spaceship ship = new Spaceship();
Asteroid thing[] = new Asteroid[10];
Stars sky[] = new Stars[250];
public void setup() 
{
  size(800,800);
  for (int i=0; i<sky.length; i++)
    sky[i] = new Stars();
  for (int i=0; i<thing.length; i++)
    thing[i] = new Asteroid();
}
public void draw() 
{
  background(0);
  ship.show();
  ship.move();
  for (int i=0; i<sky.length; i++)
    sky[i].show();
  for (int i=0; i<thing.length; i++)
  {
    thing[i].show();
    thing[i].move();
  }
}
public void keyPressed()
{
  if (key == 'w')
  {
      ship.accelerate(.3);
  }
    if (key == 'a')
  {
    //ship.setDirectionX(ship.getPointDirection());
    ship.turn(-10);
  }
    if (key == 's')
  {
     ship.accelerate(-.3);
  }
    if (key == 'd')
  {
    //ship.setPointDirection(ship.getPointDirection());
    ship.turn(10);
  }
  if (key == ' ')
  {
    ship.setX(((int)(Math.random()*780)+10));
    ship.setY(((int)(Math.random()*780)+10));
    ship.setDirectionX(0);
    ship.setDirectionY(0);
    ship.setPointDirection((int)(Math.random()*360));
  }
}