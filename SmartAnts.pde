//SmartAnts
//Ants using a Generic Algoritm to find a target

int lifespan = 300;
int lifeCount = 0;

color bgColor = color(0);

Population population;

PVector target;

void setup() {
  size(480, 360);

  population = new Population(20);

  target = new PVector(width/2, 30);
}

void draw() {
  background(bgColor);

  population.update();

  lifeCount++;
  if (lifeCount == lifespan) {
    population.evaluate();
    population.selection();

    lifeCount = 0;
  }

  float temp = population.populationArray.get(0).vel.mag();
  println(lifeCount, temp);

  fill(255, 200);
  noStroke();
  ellipse(target.x, target.y, 30, 30);
}

public float clamp(float val, float min, float max) {
  if (val<min) val = min;
  else if (val > max) val = max;
  return val;
}