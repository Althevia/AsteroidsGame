class Stars //note that this class does NOT extend Floater
{
  private int myX, myY, myRadius;
  public Stars()
  {
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
    myRadius = (int)(Math.random()*5)+3;
  }
  public void show()
  {
    ellipse(myX,myY,myRadius,myRadius);
  } 
}