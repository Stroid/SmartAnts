class Ball {

  PVector pos;
  PVector vel;
  PVector acc;

  float r;
  float stWeight;

  color c;

  DNA dna;

  public Ball(int x, int y, int r) {
    pos = new PVector(x, y);
    vel = new PVector();
    acc = new PVector();

    dna = new DNA();


    this.r = clamp(r, 5, 50); //clamp the radius between a max and a min value.
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

    ball();
  }

  //draw the ball and rotate it by the heading of the velocity
  private void ball() {
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rotate(this.vel.heading());
    ellipse(0, 0, this.r*2, this.r*2);
    line(0, 0, this.r, 0);
    popMatrix();
  }

  public void addForce(PVector force) {
    this.acc.add(force);
  }
}