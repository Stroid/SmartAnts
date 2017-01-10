class HUD {

  int iterations;

  float lastMax;

  float best;

  public HUD() {
    iterations = 0;
  }

  public void update() {
    if (lastMax>best) {
      best = lastMax;
    }
  }

  public void render() {
    fill(255);
    textSize(15);

    text("Frame:"+lifeCount + "/" + lifespan, 10, 20);
    text("Iteration:"+iterations, 10, 35);
    text("Last max:"+int(lastMax), 10, 50);
    text("Best Fittnes:"+int(best), 10, 65);
  }
}