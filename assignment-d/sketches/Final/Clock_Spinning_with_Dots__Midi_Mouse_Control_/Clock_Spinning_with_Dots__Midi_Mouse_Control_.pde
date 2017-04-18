//reference taken from https://processing.org/examples/clock.html


import codeanticode.syphon.SyphonServer;
import sojamo.midimapper.*;
MidiMapper midi;
AssignedDevice launchControl;
float b; //midi knob
float c; 
float f; 
float g; 
float h; //midi knob

float secondsRadius;
int cx, cy;


SyphonServer syphon;

void settings() {
  size(1280, 720, P3D);
  PJOGL.profile=1;
  smooth(8);
}  

void setup() {
 // size(960, 540);
  syphon = new SyphonServer( this , "p5-to-syphon" );
  midi = new MidiMapper(this);
    /* SLIDER/KNOB is the name of the Korg nanoKontrol2 device as detected on osx */
  midi.connect("Launch Control").assign(21).to("b").assign(22).to("c").assign(23).to("f").assign(24).to("g").assign(25).to("h");
    //midi.test(Akai);
  noFill();
  smooth(3);
  //hint(ENABLE_STROKE_PERSPECTIVE);
  
   
  int radius = min(width, height) / 2;  
  secondsRadius = radius * 0.72;
  cx = width / 2;
  cy = height / 2;
}

void draw() {
       
        syphon.sendScreen( );
        background(255);
        float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
        strokeWeight(1);
        stroke(213,27,27);
        line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
        
        float maxX = (float)180/width*mouseX;    //Using mouseX/Y to control movement of Dots
        float maxY = (float)180/height*mouseY;

        translate(width/2, height/2);
   
   for (int i = 0; i < 360; i+=b) {   //control spacing between dots with midi control "b"
        stroke(.5);
        float x = sin(radians(i)) * maxX;
        float y = cos(radians(i)) * maxY;
        
        pushMatrix();
        translate(-x, -y);
        rotate(radians(i-frameCount*9));
        //stroke((frameCount+1)%40,10,0);
        noStroke();
        fill(c+f);                         //controls visiblity of dots using midi control
        ellipse(0, 0, 2, 2);
        popMatrix();
       
        pushMatrix();
        translate(-x, +y);
        rotate(radians(i-frameCount));
        rect(150, 150, 2, 2);
        popMatrix();
        
        pushMatrix();
        translate(-x, +y);
        rotate(radians(i-frameCount));
        rect(130, 130, 2, 2);
        popMatrix();
        
        
        pushMatrix();
        translate(-x, +y);
        rotate(radians(i-frameCount));
        rect(180, 170, 2,2 );
        popMatrix();
        
        pushMatrix();
        translate(+x, -y);
        rotate(radians(i-frameCount));
        rect(90, 50, 2, 2);  
        popMatrix();
    
      if(keyPressed)
      
      {
      
        pushMatrix();
        translate(-x, +y);
        rotate(radians(i-frameCount));
        rect(100, 50, 2, 2);
        popMatrix(); 
          
        pushMatrix();
        translate(-x, +y);
        rotate(radians(i-frameCount+000.11));
        rect(110, 110, 3, 3);
        popMatrix();
       
      }

      if(mousePressed)
      {
      
        pushMatrix();
        translate(-x, +y);
        rotate(radians(i-frameCount));
        rect(85, 85, 3, 3);
        popMatrix();
            
      }
  }
}