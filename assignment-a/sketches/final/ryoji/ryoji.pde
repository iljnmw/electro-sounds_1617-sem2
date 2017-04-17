
 import sojamo.animatedgif.*;
  
  GifRecorder gif;
int x = 0;

void setup() {
  size(960, 540);
  stroke(255);
  gif = new GifRecorder(this);
    // set the update time per second, here 100ms
    gif.setMillisBetweenFrames(20);
    // set the duration of the gif
    gif.setDuration(3000);
    // loop the gif 
    gif.setLoop(true);
    gif.setScale(1);
}

void draw() {
  background(random(0,255));
  
   
for (int i = 0; i < 1000; i = i+5){
line(i, 0, i, width/3);
strokeWeight(random(17));
  }
  for (int i = 0; i < 1000; i = i+2){

    line(i, height/2, i, width);
    strokeWeight(random(7));
  }
  if (x < 100) {
    line(x, 0, x, 100);
    x = x *100;
  }
  
  }
  // Saves each frame as screen-0001.tif, screen-0002.tif, etc.

  void keyPressed() {
    switch(key) {
    // press key 'r' to start recording 
    // after the recording has finished, the gif
    // will be saved to disc automatically
      case('r'):gif.record();break;
    }
    
 }