class Asteroid extends Floater
{
  private int spin;
  private int x, y;
  private float s;
  private int rotationSpeed;
  public Asteroid()
  {
    if ((int)(Math.random()*3)==0){rotationSpeed = (int)(Math.random()*2)+1;}
    else {rotationSpeed = -((int)(Math.random()*2)+1);}
    x = (int)(Math.random()*800)-400;
    y = (int)(Math.random()*800)-400;
    s = 1.25;
    corners=6;  //the number of corners, a triangular floater has 3   
    xCorners= new int[corners];   
    yCorners= new int[corners]; 
    xCorners[0]=(int)(10*s);
    xCorners[1]=(int)(25*s);
    xCorners[2]=(int)(10*s);
    xCorners[3]=(int)(-10*s);
    xCorners[4]=(int)(-10*s);
    xCorners[5]=(int)(10*s);
    yCorners[0]=(int)(-20*s);
    yCorners[1]=(int)(0*s);
    yCorners[2]=(int)(20*s);
    yCorners[3]=(int)(10*s);
    yCorners[4]=(int)(-10*s);
    yCorners[5]=(int)(-20*s);
    myColor=(100);   
    myCenterX=400+x;
    myCenterY=400+y;  
    if ((int)(Math.random()*3)==0){myDirectionX = (Math.random()*3)+1;}
    else {myDirectionX = -((Math.random()*3)+1);}
    if ((int)(Math.random()*3)==0){myDirectionY = (Math.random()*3)+1;}
    else {myDirectionY = -((Math.random()*3)+1);}
    myPointDirection=0;
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
  public void move () 
  {      
    turn(rotationSpeed);
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY; 
    
    if(myCenterX >width+20)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<-20)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height+20)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < -20)
    {     
      myCenterY = height;    
    }   
  }   
}