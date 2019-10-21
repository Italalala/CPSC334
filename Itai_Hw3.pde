import processing.net.*; 
Client myClient;

PImage [] pics= new PImage[60];
int picNum = 0;
int pressReading=0;
int pressMax=0;
int pressMin=0;

int timer=0;
int val;


void setup(){
  background(#000000);
  fill(#ffffff);
  fullScreen();
  for (int i=0; i<51; i++){
    pics[i]=loadImage("mouth ("+str(i+1)+").jpg");
  }
  myClient = new Client(this, "127.0.0.1", 5204); 
  
  calibrate();
  
  
}

void draw(){
  pressReading=myClient.read();
  picNum = 51*(pressReading-pressMin)/(pressMax-pressMin);
  image(pics[picNum],0,0,width,height);
}

void calibrate(){
  text("Calibrating", width/2, height/2);
  if( timer>=100){
    return;
  }
  val = myClient.read();
  if(val>pressMin){
    pressMin = val; 
  }
  if (val<pressMax){
    pressMax = val;
  }
  timer++;
  delay(100);
}
