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
  for (int i = 0; i<p.length; i++) {
  p[i] = new Pa();
  }
  
  
  //background((frameCount+1%255),20);
  smooth(8);
  noFill();
  //stroke(40);
  strokeWeight(random(0.9,0.0001));
}

void draw() {
       syphon.sendScreen();
       
       //background(0);
  background(255); 
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
        stroke(0, map(d, limit/2, limit, 255, 1));
        line(x, y, p[i].x, p[i].y);
      }
    }
    x = lm(x, width);
    y = lm(y, width);
  }
  
  //void render(){
  //   for (int i = 0; i<p.length; i++) {
  //  p[i].show(i);
  //}
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