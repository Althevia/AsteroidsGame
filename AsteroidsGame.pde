Spaceship ship = new Spaceship();
ArrayList<Asteroid> meteor;
Stars[] sky = new Stars[250];
Stars[] gameover = new Stars[250];
ArrayList <Bullet> pewpew;
boolean start = false;
boolean end = false;
boolean win = false;
boolean show = true;
boolean gameoverstars = false;
int score = 0;
UFO alien = new UFO();
ArrayList <UFObullet> UFOattack;
int count = 0;
boolean onScreen = false;
public void setup() 
{
  size(800, 800);
  for (int i=0; i<sky.length; i++)
    sky[i] = new Stars();

  meteor = new ArrayList <Asteroid>();
  for (int i=0; i<8; i++)
  {
    Asteroid rock = new Asteroid();
    meteor.add(i, rock);
  }
  pewpew = new ArrayList <Bullet>();
  UFOattack = new ArrayList <UFObullet>();
}
public void draw() 
{
  background(0);
  ship.show();
  ship.move();
  if (show == true)
    alien.show();
  for (int i=0; i<sky.length; i++)
    sky[i].show();
  for (int i=0; i<meteor.size(); i++)
  {
    meteor.get(i).show();
    meteor.get(i).move();
    if (dist(meteor.get(i).getX(), meteor.get(i).getY(), ship.getX(), ship.getY())<50)
    {
      if (start == true)
      {
        meteor.remove(i);
        i--;
        ship.damage();
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
      if (dist(pewpew.get(i).getX(), pewpew.get(i).getY(), meteor.get(m).getX(), meteor.get(m).getY())<30)
      {
        meteor.remove(m);
        m--;
        score = score + 1;
      }
    if (dist(pewpew.get(i).getX(), pewpew.get(i).getY(), alien.getX(), alien.getY())<30)
    {
      onScreen=false;
      show = false;
    }
  }
  for (int i=0; i<UFOattack.size();i++)
  {
    if (dist(UFOattack.get(i).getX(),UFOattack.get(i).getY(),ship.getX(),ship.getY())<30)
      {
        ship.damage();
        UFOattack.remove(i);
        i--;
      }
    if (ship.gethp()<1)
      end = true;
  }
  textSize(30);
  fill(255);
  text("HP Remaining: "+ship.gethp(), 10, 40);
  if (meteor.size()<1)
    win = true;
  if (win == true)
  {
    show = false;
    background(0);
    textSize(40);
    textAlign(CENTER);
    if (gameoverstars == false)
      for (int i=0; i<gameover.length; i++)
        gameover[i] = new Stars();
    for (int i=0; i<gameover.length; i++)
      gameover[i].show();
    gameoverstars = true;
    text("Victory!", 400, 380);
    text("Score: "+score, 400, 420);
  }
  if (start == true)
  {
    for (int i=0; i<UFOattack.size(); i++)
    {
      UFOattack.get(i).show();
      UFOattack.get(i).move(ship, alien);
    }
  }

  if (meteor.size()<3)
  {
    alien.move();
    if (alien.getX()>100&&show==true&&win==false&&end==false)
      onScreen = true;
  }
  if (onScreen == true)
  {
    if ((count%30==0)&&(end==false)&&start==true&&win==false&&end==false)
    {
      UFObullet bullets = new UFObullet(alien);
      UFOattack.add(bullets);
    }
    count = count + 1;
  }

  if (end==true)
  {
    show = false;
    background(0);
    textSize(40);
    textAlign(CENTER);
    if (gameoverstars == false)
      for (int i=0; i<gameover.length; i++)
        gameover[i] = new Stars();
    for (int i=0; i<gameover.length; i++)
      gameover[i].show();
    gameoverstars = true;
    text("Game Over!", 400, 380);
    text("Score: "+score, 400, 420);
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