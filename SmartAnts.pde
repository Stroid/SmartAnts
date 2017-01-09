//SmartAnts
//Ants using a Generic Algoritm to find a target

int lifespan = 200;
int lifeCount = 0;

float maxForce = 0.2;

float avgFit = 0;

color bgColor = color(0);

Population population;

PVector target;

HUD hud;

void setup() {
  size(480, 360);

  population = new Population(20);

  target = new PVector(width/6*5, 30);

  hud = new HUD();
}

void draw() {
  background(bgColor);

  population.update();

  hud.update();
  hud.render();

  lifeCount++;
  if (lifeCount == lifespan) {
    avgFit = population.evaluate();
    population.selection();

    lifeCount = 0;

    hud.iterations++;
  }

  fill(255, 150);
  stroke(255);
  strokeWeight(2);
  ellipse(target.x, target.y, 30, 30);
}

public float clamp(float val, float min, float max) {
  if (val<min) val = min;
  else if (val > max) val = max;
  return val;
}