class DNA {

  ArrayList<PVector> genes = new ArrayList();
  public DNA(ArrayList<PVector>... genes) {
    if (genes.length>0) {
      this.genes = genes[0];
    } else {
      for (int I=0; I<lifespan; I++) {
        this.genes.add(PVector.random2D());
        this.genes.get(I).setMag(0.1);
      }
    }
  }

  public DNA crossover(DNA partner) {
    ArrayList<PVector> newGenes = new ArrayList();
    int mid = int(random(this.genes.size()));
    for (int I = 0; I < this.genes.size(); I++) {
      if (I < mid) {
        newGenes.add(this.genes.get(I));
      } else {
        newGenes.add(partner.genes.get(I));
      }
    }
    return new DNA(newGenes);
  }
  
  public void mutation(){
    for (int I = 0; I < this.genes.size(); I++) {
      if (random(1) < 0.01){
        this.genes.set(I, PVector.random2D());
        this.genes.get(I).setMag(0.1);
      }
    }
  }
}