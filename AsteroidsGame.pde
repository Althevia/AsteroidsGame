Spaceship ship = new Spaceship();
ArrayList<Asteroid> meteor;
Stars[] sky = new Stars[250];
Stars[] gameover = new Stars[250];
ArrayList <Bullet> pewpew;
boolean start = false;
boolean end = false;
boolean win = false;
boolean gameoverstars = false;
int score = 0;
//score = score + 1;
public void setup() 
{
  size(800, 800);
  for (int i=0; i<sky.length; i++)
    sky[i] = new Stars();

  meteor = new ArrayList <Asteroid>();
  for (int i=0; i<10; i++)
  {
    Asteroid rock = new Asteroid();
    meteor.add(i, rock);
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
    if (dist(meteor.get(i).getX(), meteor.get(i).getY(), ship.getX(), ship.getY())<40)
    {
      if (start == true)
      {
        meteor.remove(i);
        i--;
        ship.damage();
        System.out.println(ship.gethp());
        if (ship.gethp()<1)
          end = true;
      }
    }
  }
  for (int i=0; i<pewpew.size(); i++)
  {
    pewpew.get(i).show();
    pewpew.get(i).move();
    for (int m=0; m<meteor.size(); m++)
      if (dist(pewpew.get(i).getX(),pewpew.get(i).getY(),meteor.get(m).getX(),meteor.get(m).getY())<20)
        {
          meteor.remove(m);
          m--;
          score = score + 1;
        }
  }
  textSize(30);
  fill(255);
  text("HP Remaining: "+ship.gethp(),10,40);
  if (meteor.size()<1)
    win = true;
  if (win == true)
  {
    background(0);
    textSize(40);
    textAlign(CENTER);
    if (gameoverstars == false)
      for (int i=0; i<gameover.length; i++)
        gameover[i] = new Stars();
      for (int i=0; i<gameover.length; i++)
        gameover[i].show();
      gameoverstars = true;
    text("Victory!",400,380);
    text("Score: "+score,400,420);
  }
  if (end==true)
  {
    background(0);
    textSize(40);
    textAlign(CENTER);
    if (gameoverstars == false)
      for (int i=0; i<gameover.length; i++)
        gameover[i] = new Stars();
      for (int i=0; i<gameover.length; i++)
        gameover[i].show();
      gameoverstars = true;
    text("Game Over!",400,380);
    text("Score: "+score,400,420);
    System.out.println(100);
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
    start = true;
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