float x=150, y=150, xLast=350, yLast=150;


void setup(){
  size(960,540);
  background(255);
  smooth(8);
  frameRate(15); // set the speed of the frameRate
}
 
void draw(){
   
  // coordinate for x and y
  //using random 
  x=random(340,width-340);
  y=random(10,height-10);
  
  // draw a line underneath the white line
  stroke(0);
  line(x,y,xLast,yLast);
  // draw a white line
  stroke(0);
  line(x,y,xLast,yLast);
   
  //previous coordinate
  xLast = x;
  yLast = y;
  
  
  if(keyPressed){
    
    saveFrame("friederNake.png");
  }
}