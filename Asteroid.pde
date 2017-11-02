class Asteroid extends Floater
{
  private int spin;
  private int x, y;
  private int rotationSpeed;
  Asteroid()
  {
    if ((int)(Math.random()*3)==0){rotationSpeed = (int)(Math.random()*2)+1;}
    else {rotationSpeed = -((int)(Math.random()*2)+1);}
    x = (int)(Math.random()*800)-400;
    y = (int)(Math.random()*800)-400;
    corners=6;  //the number of corners, a triangular floater has 3   
    xCorners= new int[corners];   
    yCorners= new int[corners]; 
    xCorners[0]=10;
    xCorners[1]=25;
    xCorners[2]=10;
    xCorners[3]=-10;
    xCorners[4]=-10;
    xCorners[5]=10;
    yCorners[0]=-20;
    yCorners[1]=0;
    yCorners[2]=20;
    yCorners[3]=10;
    yCorners[4]=-10;
    yCorners[5]=-20;
    myColor=(100);   
    myCenterX=400+x;
    myCenterY=400+y;  
    if ((int)(Math.random()*3)==0){myDirectionX = (int)(Math.random()*2)+1;}
    else {myDirectionX = -((int)(Math.random()*2)+1);}
    if ((int)(Math.random()*3)==0){myDirectionY = (int)(Math.random()*2)+1;}
    else {myDirectionY = -((int)(Math.random()*2)+1);}
    myPointDirection=10; 
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
    super.move();
  }   
}