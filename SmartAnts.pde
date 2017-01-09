//SmartAnts
//Ants using a Generic Algoritm to find a target

int lifespan = 200;
int lifeCount = 0;

color bgColor = color(0);

Population population;

void setup(){
  size(480,360);
  
  population = new Population(20);
}

void draw(){
  background(bgColor);
  
  population.update();
  population.render();
  
  
  lifeCount++;
  lifeCount = int(clamp(lifeCount++,0,lifespan-1));
  float temp = population.populationArray.get(0).vel.mag();
  println(lifeCount,temp);
}

public float clamp(float val, float min, float max){
  if(val<min) val = min;
  else if(val > max) val = max;
  return val;
}
