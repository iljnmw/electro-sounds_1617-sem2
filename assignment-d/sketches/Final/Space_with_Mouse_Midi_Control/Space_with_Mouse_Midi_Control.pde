
//reference from https://www.openprocessing.org/sketch/96938

import codeanticode.syphon.SyphonServer;
import sojamo.midimapper.*;

MidiMapper midi;
AssignedDevice launchControl;
float b; //midi knob
float c; 
float f; 
float g; 
float h; //midi knob

ArrayList<PVector> dot = new ArrayList<PVector>(); //Creating an array list of Dots
float h2;
float w2;
float d2;


SyphonServer syphon;

void settings() {
  //fullScreen(P3D);
  size(1280, 720,P3D);
  PJOGL.profile=1;
  smooth(8);
}  

void setup() {
 //size(960, 540);
 //fullScreen();
  smooth(2);

  syphon = new SyphonServer( this , "p5-to-syphon" );
  midi = new MidiMapper(this);
  midi.connect("Launch Control").assign(21).to("b").assign(22).to("c").assign(23).to("f").assign(24).to("g").assign(25).to("h");
  
  w2=width/2;
  h2= height/2;
  d2 = dist(0, 0, w2, h2); //calculating the distance 
  noStroke();
  
 
  
}
void draw() {
  
  syphon.sendScreen();
  
  fill(255, map(dist(mouseX, mouseY, w2, h2), 0, d2, 255, 10));
  rect(0, 0, width, height);
  fill(0);
  
  for (int i = 0; i<100; i++) {   // initialize dots
  dot.add(new PVector(random(width), random(height), random(0.1, .3)));}

  for (int i = 0; i<dot.size(); i++) {
    float x =dot.get(i).x;
    float y =dot.get(i).y;
    float d =dot.get(i).z;

      
    dot.set(i, new PVector(x-map(mouseX, 0, width, -0.005, 0.005)*(w2-x), y-map(mouseY, 0, height, -0.05, 0.05)*(h2-y), d+0.2-0.6*noise(x, y, frameCount))); //Using MouseX/Y to control movement and direction of Dots
    
    if (d>4||d<-4) dot.set(i, new PVector(x, y, 3));
    if (x<0||x>width||y<0||y>height) dot.remove(i);
    if (dot.size()>10000) dot.remove(1);
    rect(x, y, .5, b); //midi control size of dot
    //rect(x, y, .5, .5);
  }

}