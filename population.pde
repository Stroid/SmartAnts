class Population{
  ArrayList<Ball> populationArray = new ArrayList();
  
  public Population(int n){
    for(int I=0; I<n; I++){
      populationArray.add(new Ball(width/2,height,7));
    }
  }
  
  public void update(){
    for(int I=0; I<populationArray.size();I++)
      populationArray.get(I).update();
  }
  
  public void render(){
    for(int I=0; I<populationArray.size();I++)
      populationArray.get(I).render();
  }
  
}