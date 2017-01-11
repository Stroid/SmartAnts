class Population {
  ArrayList<Ant> populationArray = new ArrayList();
  ArrayList<Ant> matingPool = new ArrayList();

  Ant bestAnt = null;
  Ant newBest;

  public Population(int n) {
    for (int I=0; I<n; I++) {
      populationArray.add(new Ant(color(0, 255, 0)));
    }
  }

  public float evaluate() {
    float maxFit = 0;
    float total = 0;


    this.matingPool.clear();

    for (int I = 0; I < this.populationArray.size(); I++) {
      this.populationArray.get(I).calcFit();
      if (this.populationArray.get(I).fittnes>maxFit) {
        maxFit = this.populationArray.get(I).fittnes;
        this.newBest = this.populationArray.get(I);
      }
    }

    if (this.bestAnt == null || this.newBest.fittnes>this.bestAnt.fittnes) {
      this.bestAnt = new Ant(color(0, 255, 255), this.newBest.dna);
    }


    for (int I = 0; I < this.populationArray.size(); I++) {
      this.populationArray.get(I).fittnes /= maxFit;
      total += this.populationArray.get(I).fittnes;
    }

    for (int I = 0; I < this.populationArray.size(); I++) {
      float n = this.populationArray.get(I).fittnes*100;

      for (int J = 0; J < n; J++) {
        this.matingPool.add(this.populationArray.get(I));
      }
    }

    hud.lastMax = maxFit;
    return total/this.populationArray.size();
  }

  void selection() {
    ArrayList<Ant> newPopulation = new ArrayList();
    int indexA;
    int indexB;

    for (int I = 0; I < populationArray.size(); I++) {
      //Pick to diffrent parrents
      indexA = int(random(this.matingPool.size()));
      indexB = int(random(this.matingPool.size()));

      //Get Parrents DNA and perform a crossover to a child dna.
      DNA parrentA = matingPool.get(indexA).dna;
      DNA parrentB = matingPool.get(indexB).dna;
      DNA child = parrentA.crossover(parrentB);

      //Perform a mutation on the child genes
      child.mutation();

      //Make a new Population of ants whith the child dna.
      newPopulation.add(new Ant(color(0, 255, 0), child));
    }

    //Replace the old population whith the new population.
    this.populationArray = newPopulation;
  }

  public void update() {
    for (int I=0; I<populationArray.size(); I++) {
      populationArray.get(I).update();
      populationArray.get(I).render();

      if (bestAnt != null) {
        this.bestAnt.update();
        this.bestAnt.render();
      }
    }
  }
}