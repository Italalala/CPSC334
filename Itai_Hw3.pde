import processing.net.*; 
Client myClient;

//import udp library
import hypermedia.net.*;

PImage pic;

int picNum = 0;
int prevPicNum = -1;
int pressReading=0;
int pressMax=0;
int pressMin=2000000;

int sensorVal;

int PORT = 5002;
String IP = "192.168.1.2";
UDP udp;
int cal=0;
String msg;

void setup(){
  /*udp = new UDP(this, PORT, IP);  // create a new datagram connection on port 5002 
  udp.listen(true);*/
  //udp.log(true);
  
  size(1500,1100);
  background(#00fff0);
  fill(#ffffff);
  textSize(40);
  

  /*for (int i=0; i<51; i++){
    pics[i]=loadImage("mouth ("+str(i+1)+").jpg");
  }*/
  myClient = new Client(this, "127.0.0.1", 5022);
}

void draw(){
  if (myClient.available() > 0) {
    sensorVal= myClient.read();
    println(sensorVal);
    delay(500);
  }
  /*if(cal==0){
    calibrate();
    delay(10000);
  }*/
  //delay(500);
  //println(sensorVal);
  //delay(1000);
  /*picNum = int(51*(pressReading-pressMin)/(pressMax-pressMin));
  if(picNum!=prevPicNum){
    prevPicNum=picNum;
    pic=loadImage("mouth ("+str((picNum+1)%51)+").jpg");
    image(pic,0,0,width,height);
  }*/
}

/*void receive(byte[] data, String IP, int PORT) {
  println("RRRRRR");// <-- default handler
  //if (data != null) {
    msg = new String(data);
    println("receiving"+msg);
    sensorVal = int(msg);
   //}
}*/

/*void calibrate(){
  while(cal<10){
    println("Calibrating. "+ str(10-cal) +" seconds left");
    if(sensorVal>pressMin){
      pressMin = sensorVal; 
      println("pressMin "+pressMin);
    }
    if (sensorVal<pressMax){
      pressMax = sensorVal;
      println("pressMax "+pressMax);
    }
    delay(1000);
    cal++;
  }
  return;
}*/
