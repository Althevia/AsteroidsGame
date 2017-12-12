class UFO extends Floater  
{   
  private int UFOhp;
  private int spawnPoint;
  public UFO()
  {
    UFOhp = 1;
    spawnPoint = (int)(Math.random()*2);
    corners=10;  //the number of corners, a triangular floater has 3   
    int []CornX = {0,10,25,40,25,-25,-40,-25,-10,0};
    int []CornY = {30,25,10,0,-10,-10,0,10,25,30};
    xCorners= CornX;   
    yCorners= CornY; 
    myColor=(255);   
    myCenterX=-100;
    if (spawnPoint == 0)
      myCenterY=100;
    else
      myCenterY=700;
    myDirectionX=1;
    myDirectionY=0; //holds x and y coordinates of the vector for direction of travel   
    myPointDirection=180; //holds current direction the ship is pointing in degrees
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

  public void damage()
  {
    if (start == true)
      UFOhp = UFOhp - 1;
  }
  public int gethp() {
    return (int)UFOhp;
  }  
  
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
    fill(52, 170, 58);
    ellipse((float)myCenterX,(float)myCenterY-15,20,25);
    fill(255);
  }   
  
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width+100)
    {     
      myCenterX = -100;    
    }    
  }   

}