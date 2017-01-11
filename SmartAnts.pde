//SmartAnts
//Ants using a Generic Algoritm to find a target

int lifespan = 500;
int lifeCount = 0;

float maxForce = 0.2;

float avgFit = 0;

color bgColor = color(0);

Population population;

PVector target;

HUD hud;

Obsticle obsticle;
Obsticle obsticle1;

void setup() {
  size(500, 800);

  population = new Population(20);

  target = new PVector(width/2, 30);

  hud = new HUD();
  
  obsticle = new Obsticle(width/3*2, height/3*2,250,20);
  obsticle1 = new Obsticle(width/3, height/3, 250, 20);
}

void draw() {
  background(bgColor);

  population.update();

  hud.update();
  hud.render();

  obsticle.render();
  obsticle1.render();

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
  target.x = width/2;
  target.y = 80; //<>//
  ellipse(target.x, target.y, 30, 30);
}

public float clamp(float val, float min, float max) {
  if (val<min) val = min;
  else if (val > max) val = max;
  return val;
}