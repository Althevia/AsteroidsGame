class Spaceship extends Floater  
{   
  private int hp;
  public Spaceship()
  {
    hp = 3;
    corners=3;  //the number of corners, a triangular floater has 3   
    xCorners= new int[corners];   
    yCorners= new int[corners]; 
    xCorners[0]=-20;
    xCorners[1]=40;
    xCorners[2]=-20;
    yCorners[0]=20;
    yCorners[1]=00;
    yCorners[2]=-20;
    myColor=(255);   
    myCenterX=400;
    myCenterY=400; //holds center coordinates   
    myDirectionX=0;
    myDirectionY=0; //holds x and y coordinates of the vector for direction of travel   
    myPointDirection=0; //holds current direction the ship is pointing in degrees
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
  //public void accelerate (double dAmount)   //attempting to limit acceleration
  //{          
  //  //convert the current direction the floater is pointing to radians    
  //  double dRadians =myPointDirection*(Math.PI/180);     
  //  //change coordinates of direction of travel
  //  if (dAmount < 0)
  //    if (myDirectionX>-5)
  //        myDirectionX += ((dAmount) * Math.cos(dRadians)); 
  //    if (myDirectionY>-5)
  //        myDirectionY += ((dAmount) * Math.sin(dRadians));  
  //  if (dAmount > 0)
  //    if (myDirectionX<5)
  //        myDirectionX += ((dAmount) * Math.cos(dRadians)); 
  //    if (myDirectionY<5)
  //        myDirectionY += ((dAmount) * Math.sin(dRadians));       
  //}  
  public void damage()
  {
    if (start == true)
      hp = hp - 1;
  }
  public int gethp() {
    return (int)hp;
  }  
}