class Ant {

  PVector pos;
  PVector vel;
  PVector acc;

  float r;
  float stWeight;
  float fittnes;


  color c;

  DNA dna;

  public Ant(DNA... dna) {
    this.pos = new PVector(width/2, height);
    this.vel = new PVector();
    this.acc = new PVector();
    this.r = 7;
    
    if (dna.length > 0) {
      this.dna = dna[0];
    } else {
      this.dna = new DNA();
    }
    
    stWeight = map(r, 5, 50, 1, 3); //map the stroke weight based on the radius.
    c = color(255); //set the Color of the ball
  }

  public void update() {
    this.addForce(this.dna.genes.get(lifeCount));

    this.vel.add(this.acc); //add the combined forces to the velocity
    this.pos.add(this.vel); //move the position by the velocity
    this.acc.mult(0);       //clear the forces
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
  }

  public void addForce(PVector force) {
    this.acc.add(force);
  }
}