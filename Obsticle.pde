class Obsticle {
  int rx, ry, rw, rh;

  color c = color(255, 0, 0);

  public Obsticle(int x, int y, int w, int h) {
    this.rx = x-w/2;
    this.ry = y-h/2;
    this.rw = w;
    this.rh = h;
  }

  public void render() {
    fill(c, 150);
    stroke(c);
    strokeWeight(2);
    rect(rx, ry, rw, rh);
  }

  public boolean isCrash(float x, float y) {
    if (x > this.rx && y > this.ry && x < this.rx+this.rw && y < this.ry+this.rh)
      return true;
    return false;
  }
}