//import sojamo.animatedgif.*;
  
//  GifRecorder gif;
import codeanticode.syphon.SyphonServer;

ArrayList<Integer>list;
SyphonServer syphon;

void settings() {
  size(960, 540, P3D);
  PJOGL.profile=1;
  smooth(8);
}

void setup(){
 size(960,540);
 
   syphon = new SyphonServer( this , "p5-to-syphon" );

 
 //gif = new GifRecorder(this);
 //   // set the update time per second, here 100ms
 //   gif.setMillisBetweenFrames(50);
 //   // set the duration of the gif
 //   gif.setDuration(10000);
 //   // loop the gif 
 //   gif.setLoop(true);
 //   gif.setScale(0.5);
 
 list=new ArrayList();
 for(int i= 0; i<500; i++){
    list.add(int(random(0,2000)));
  }


}

void draw(){
    background(frameCount%50);
    syphon.sendScreen( );
    background(255);
    translate(480,270);
    for(int i = 0; i<60; i++){
    pushMatrix();
    smooth(i);
    noStroke();
    rotate((frameCount*i)); 
    rect(30,30, i,i);
    fill(((frameCount+i)*10) %155,40);
    popMatrix();
  }
    
      saveFrame("Frames/1234.tga");
  
}
 //void keyPressed() {
 //   switch(key) {
 //   // press key 'r' to start recording 
 //   // after the recording has finished, the gif
 //   // will be saved to disc automatically
 //     case('r'):gif.record();break;
 //   }
    
 //}
 