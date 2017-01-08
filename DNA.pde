class DNA{

  ArrayList<PVector> genes = new ArrayList();
  public DNA(){
    for(int I=0; I<lifespan; I++){
      this.genes.add(PVector.random2D());
      this.genes.get(I).setMag(0.1);
    }
  }
  
}