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
int fc, num = 100, edge = 180;
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
      midi.connect("Launch Control").assign(21).to("b").assign(22).to("c").assign(23).to("f");
        //midi.test(Akai);
      hint(ENABLE_STROKE_PERSPECTIVE);
      smooth(8);
      noFill();
      strokeWeight(random(0.9,0.0001));
   
      for (int i = 0; i<p.length; i++) {
      p[i] = new Pa();
  }
  
  
}

void draw() {
      syphon.sendScreen();
      
     // stroke(#C70F0F); //red
      stroke(0);
      
        //Black lines

        for(int i=0; i<200; i+=2)
      {
           
          // stroke(215);
           //stroke(0);
           rotateY(frameCount*i);
           fill(225);
           //stroke(f);
           line(30*i,0, 30*i, (mouseY*3));
           line(40*i,0, 40*i, (mouseY*3));
           line(50*i,0, 50*i, (mouseY*3));
           line(60*i,0, 60*i, (mouseY*3));
           line(70*i,0, 70*i, (mouseY*3));
           line(80*i,0, 80*i, (mouseY*3));
           line(90*i,0, 90*i, (mouseY*3));
           line(100*i,0, 100*i, (mouseY*3));
           line(110*i,0, 110*i, (mouseY*3));
           line(120*i,0, 120*i, (mouseY*3));
           line(130*i,0, 130*i, (mouseY*3)); 
      }
    


pushMatrix();
      for(int i = 0; i<10000; i++)
      {
        
          //fill((frameCount*0.1)%255,40); // slow strobe
          //fill((frameCount*0.1)%255,40); // slow strobe
            fill(255,20);
         // fill(((frameCount*i))%745,90); //fast strobe
      }
            noStroke();
            rect(0, 0, width-1, height-1);
            for (int i = 0; i<p.length; i++) {
            p[i].show(i); 
       }
  popMatrix();

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
        stroke(#C70F0F, map(d, limit/2, limit, 255, f));
        line(x, y, p[i].x, p[i].y);
      }
    }
    x = lm(x, width);
    y = lm(y, height);
    y = lm(y, width);
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