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

  
  
  
  translate(480,270);
  for(int i = 0; i<60; i++){
  pushMatrix();
  smooth(i);
  noStroke();
  rotate((frameCount*i)); 
  rect(30,30, i,i);
  fill(((frameCount+i)*10) %255,20);
  popMatrix();
  }
    
    
    for (int i=0; i<list.size(); i++){
      pushMatrix();
      //translate(0,200);
      noStroke();
      fill(((frameCount*i))%445,100);
      rotate((frameCount*i)); 
      ellipse(i, 26, 3, 3);
      popMatrix();
     
   }
   
   for (int i=0; i<list.size(); i++){
      pushMatrix();
      //translate(0,200);
      noStroke();
      fill(((frameCount*i))%745,100);
      rotate((frameCount*i)*list.size()); 
      rect(list.size(), 26, i, i);
      popMatrix();
     
   }
   for (int i=0; i<400; i++){
      pushMatrix();
      noStroke();
      //fill(((frameCount*i))%245,30);
      rotate((frameCount+i)); 
      smooth(i);
      rect(0, i, i, i);
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
 