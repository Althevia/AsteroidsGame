class UFObullet extends Floater
{
  double dRadians;
  boolean check = false;
  boolean type1 = false;
  boolean type2 = false;
  boolean type3 = false;
  boolean type4 = false;
  public UFObullet(UFO theShip)
  {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    dRadians =myPointDirection*(Math.PI/180);
    myDirectionX = 5*Math.cos(Math.atan((ship.getY()-myCenterY)/(ship.getX()-myCenterX)));
    myDirectionY = 5*Math.sin(Math.atan((ship.getY()-myCenterY)/(ship.getX()-myCenterX))); 
    //myDirectionX = 5*Math.cos(Math.atan((ship.getY()-alien.getY())/(ship.getX()-alien.getX())));
    //myDirectionY = 5*Math.sin(Math.atan((ship.getY()-alien.getY())/(ship.getX()-alien.getX()))); 
    myColor = 239;
  }
  public void setX(int x) {
    myCenterX=x;
  }  
  public int getX() {
    return (int)myCenterX;
  }  
  public void setY(int y) {
    myCenterY=y;
  }     
  public int getY() {
    return (int)myCenterY;
  }   
  public void setDirectionX(double x) {
    myDirectionX=x;
  }   
  public double getDirectionX() {
    return myDirectionX;
  }   
  public void setDirectionY(double y) {
    myDirectionY=y;
  }  
  public double getDirectionY() {
    return myDirectionY;
  }   
  public void setPointDirection(int degrees) {
    myPointDirection=degrees;
  }     
  public double getPointDirection() {
    return myPointDirection;
  }
  public void show()
  {
    fill(68, 214, 55);
    stroke(68, 214, 55);
    ellipse((float)myCenterX, (float)myCenterY, 15, 15);
    fill(255);
    stroke(255);
  }
  public void move(Spaceship ship, UFO mothership)
  {
    if (check == false)
    {
      if ((mothership.getX()<ship.getX())&&(mothership.getY()>ship.getY()))
      {
        check = true;
        type1 = true;
      }
      if ((mothership.getX()>ship.getX())&&(mothership.getY()<ship.getY()))
      {
        check = true;
        type2 = true;
      }
      if ((mothership.getX()>ship.getX())&&(mothership.getY()>ship.getY()))
      {
        check = true;
        type3 = true;
      }
      if ((mothership.getX()<ship.getX())&&(mothership.getY()<ship.getY()))
      {
        check = true;
        type4 = true;
      }
    }
    if (check == true)
    {
      if (type1 == true)
      {
        myCenterX += myDirectionX;
        myCenterY += myDirectionY;
      }
      if (type2 == true)
      {
        myCenterX -= myDirectionX;
        myCenterY -= myDirectionY;
      }
      if (type3 == true)//error
      {
        myCenterX -= myDirectionX;
        myCenterY -= myDirectionY;
      }
      if (type4 == true)
      {
        myCenterX += myDirectionX;
        myCenterY += myDirectionY;
      }
    }

    //if (mothership.getX()>ship.getX())
    //  myCenterX += myDirectionX;
    //else if (mothership.getX()>ship.getX())
    //  myCenterX += myDirectionX;
    //else
    //  myCenterX += myDirectionX;
    //if (mothership.getY()<ship.getY())
    //  myCenterY += myDirectionY;
    //else if (mothership.getY()>ship.getY())
    //  myCenterY += -myDirectionY;
    //else
    //  myCenterY += myDirectionY;
  }
}