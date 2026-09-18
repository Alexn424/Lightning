int batteryDrain = 1;
int batteryGain = 50;
int batteryJuice = 100;
boolean hit = false;
int batteryMin = 0;
int batteryMax = 200;


void setup(){
  size(500,500);
  background(#D6D6D6);
  rect(225,230,50,40);
  rect(200,250,100,200);
}

void draw(){
  fill(#FFFFFF);
  stroke(#000000);
  strokeWeight(3);
  background(#D6D6D6);
  rect(225,230,50,40);
  rect(200,250,100,200);
  fill(#ADFF62);
  if (hit){
    batteryJuice += batteryGain;
    hit = false;
  }else{
    batteryJuice -= batteryDrain;
  }
  if (batteryJuice <= batteryMin){
    batteryJuice = batteryMin;
  }
  if (batteryJuice >= batteryMax){
     batteryJuice = batteryMax;
  }
  rect(200, 250 + (batteryMax - batteryJuice), 100, batteryJuice);
}



int globalSign = 1;
void mousePressed(){
  clear();
  background(#000000);
  strokeWeight(10);
  stroke(#FFF862);
  int startX = 250 + ((int)(Math.random() * 400)*globalSign);
  int startY = 0;
  
  int endX = startX;
  int endY = 0;
  float stroke = 0;
  while (endY < 500){
    stroke += 0.05;
    if (stroke >= 9){
      stroke = 9;
    }
    strokeWeight(10-stroke);
    int sign = (int)(Math.random() * 2);
    if (sign == 0){
      sign = -1;
    }
    else{
      sign = 1;
    }
    
    globalSign = sign;
    
    endX = startX + (int)(Math.random() * 20) * sign;
    endY = startY + (int)(Math.random()*12);
    line(startX, startY, endX, endY);
    startX = endX;
    startY = endY;
    if ((215 < endX && endX< 290)&&(210 < endY && endY < 250)){
      hit = true;
      break;
    }
  }
  
}
