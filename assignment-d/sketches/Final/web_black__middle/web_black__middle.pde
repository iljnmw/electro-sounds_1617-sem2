//Reference https://www.openprocessing.org/sketch/170789
//https://www.openprocessing.org/sketch/151109

import codeanticode.syphon.*;
import sojamo.midimapper.*;
SyphonServer syphon;
MidiMapper midi;
AssignedDevice launchControl;

float b; //midi knob
float c; //midi knob
float f; 
float g; 
float h;


int fc, num = 200, edge = 180;
boolean save = false;
Pa[] p = new Pa[200];
int limit = 200;

void settings() {
  size(1280, 720, P3D);
  PJOGL.profile=1;
  smooth(4);
}


void setup() {
 // size(960, 540);
  
  syphon = new SyphonServer( this , "p5-to-syphon" );
  midi = new MidiMapper(this);
  midi.connect("Launch Control").assign(21).to("b").assign(22).to("c").assign(23).to("f").assign(24).to("g").assign(25).to("h");
    //midi.test(Akai);
  hint(ENABLE_STROKE_PERSPECTIVE);
  
  smooth(8);
  noFill();
  strokeWeight(random(1,0.0001));

  for (int i = 0; i<p.length; i++) {
  p[i] = new Pa();
  }
  
  
 
}

void draw()

  {
    
        syphon.sendScreen();
        fill(255);
        noStroke();
        rect(0, 0, width, height);
        for (int i = 0; i<p.length; i++) {
        p[i].show(i);
        }
    
  }

class Pa {
    float x, y, vx, vy;
    public Pa() {
    x = random(width);
    y = random(height);

    float a = random(TWO_PI);
    vx = cos(a)*0.5;
    vy = sin(a)*0.01;
  }

  void show(int index) {
      x+=vx*b;
      y+= vy*c*18;
      for (int i = index+1; i<p.length; i++) {
        float d = dist(x, y, p[i].x, p[i].y);
        if (d<limit) {
          fill((frameCount+1)%255,50);
          stroke(0, map(d, limit, limit/3, f, g)); // black lines with midi control
          line(x, y, p[i].x, p[i].y);
      }
    }
    x = lm(width/2, width); //in the middle of screen
    y = lm(y, width);
    //y = lm(y, mouseY);
  }
  
 
}
float lm(float a, float b) {
  if (a<0) {
    return a+b;
  } 
  if (a>b) {
    return a-b;
  }
  return a;
}


void keyPressed() {
  fc = frameCount;
  save = true;
}
 
void keyReleased() {
for (int i = 0; i<p.length; i++) {
    p[i] = new Pa();
  }
}