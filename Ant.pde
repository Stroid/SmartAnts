class Ant {

  PVector pos;
  PVector vel;
  PVector acc;

  float r;
  float stWeight;
  float fittnes;


  color c;

  DNA dna;

  boolean finished;
  boolean crashed;
  int finishFrame;
  int crashFrame;

  public Ant(DNA... dna) {
    this.pos = new PVector(width/2, height-10);
    this.vel = new PVector();
    this.acc = new PVector();
    this.r = 7;

    if (dna.length > 0) {
      this.dna = dna[0];
    } else {
      this.dna = new DNA();
    }

    stWeight = map(r, 5, 50, 1, 3); //map the stroke weight based on the radius.
    c = color(0, 255, 0); //set the Color of the ball
  }

  public void update() {
    this.addForce(this.dna.genes.get(lifeCount));

    checkFinish();
    checkCrash();

    if (!finished && !crashed) {
      this.vel.add(this.acc); //add the combined forces to the velocity
      this.pos.add(this.vel); //move the position by the velocity
      this.acc.mult(0);       //clear the forces
    }
  }

  public void checkFinish() {
    float d = dist(this.pos.x, this.pos.y, target.x, target.y);
    if (d<10 && !finished) {
      this.finished = true;
      this.finishFrame = lifeCount;
    }
  }

  public void checkCrash() {
    if (this.pos.x < this.r || this.pos.x > width-this.r || this.pos.y < this.r || this.pos.y > height-this.r) {
      this.crashed = true;
      this.crashFrame = lifeCount;
    } else if (obsticle.isCrash(this.pos.x, this.pos.y)) {
      this.crashed = true;
      this.crashFrame = lifeCount;
    }
  }

  public void render() {
    fill(c, 100); //fill the ball width the 'c' color and apply some alpha
    stroke(c);   //set the strokeColor to the 'c' color
    strokeWeight(stWeight); //set the strokeWeight

    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rotate(this.vel.heading());
    ellipse(0, 0, this.r*2, this.r*2);
    line(0, 0, this.r, 0);
    popMatrix();
  }

  public void calcFit() {
    float d = dist(this.pos.x, this.pos.y, target.x, target.y);

    this.fittnes = map(d, 0, width, width, 0);

    if (this.finished) {
      this.fittnes *= map(finishFrame, 200, lifespan, 15, 5);
    }
    if (this.crashed) {
      this.fittnes /= 10;
    }
  }

  public void addForce(PVector force) {
    this.acc.add(force);
  }
}