private double fractionLength = .8; 
private int smallestBranch = 5; 
private double branchAngle = .4;  
public int x = -250;
public void setup() 
{   
  size(700,700);  
} 
public void draw() 
{   
  background(7,30,139);   
  stroke((float)Math.random()*255, (float)Math.random()*255, (float)Math.random()*255);   
   line(x,850,x+10,650);   
   drawBranches(x,650,50,3*Math.PI/2);
   x+=10;
   if(x > 900){
     x = -250;
   }
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle + .999;
  double angle2 = angle - branchAngle - 0.0001;
  branchLength*=fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if(branchLength > smallestBranch){
    drawBranches(endX1,endY1,branchLength,angle1);
    drawBranches(endX2,endY2,branchLength,angle2);
  }
} 
