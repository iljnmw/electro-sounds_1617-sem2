int allxpoints[] = new int[50];
int allypoints[] = new int[50];

void setup(){
  size(960,540);
  background(255);
  stroke(5, 55);
  smooth();
}

void draw(){
for(int n =0; n<50; n++){
  allxpoints[n] = int(random(50, width));
  allypoints[n] = int(random(50, height));

  for(int j = 0; j<n; j++){
    line(allxpoints[n], allypoints[n],
    allxpoints[j], allypoints[j]);

  }
}
noLoop();
}