class HUD {

  ArrayList<String> debugText = new ArrayList();
  
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
    
    addText("Frame:"+lifeCount + "/" + lifespan);
    addText("Iteration:"+iterations);
    addText("Last max:"+int(lastMax));
    addText("Best Fittnes:"+int(best));
    addText("Crash count:" + crashCount);
    addText("Finnish Count:" + finnishCount);
    
    this.displayText();
  }
  
  public void addText(String s){
    debugText.add(s);
  }
  
  public void displayText(){
    int tS = 15;
    textSize(tS);
    for(int I = 0; I<debugText.size(); I++){
      text(debugText.get(I), 10, 20+tS*I);
    }
    debugText.clear();
  }
}