

class Predator extends Mover {

    
  /** BEGIN : Hunting variables **/
  //boolean isHunting = false;
  boolean isChasing = false;
  float preyingDistance;
  
  int closestPrey = -1;
  
  int preysEaten = 0;
  int preysLimit = 30;
  
  ArrayList<Boid> preys;
  ArrayList <Food> poops;
  
  Prey prey;
  
  /** END : Hunting variables **/

  Predator (World world) {
    super (world);
  }
  
  void update(float deltaTime) {
  
  }
  public int getLimit()
  {
    return this.preysLimit;
  }
  public void incLimit()
  {
    this.preysLimit += (0.2 * preysLimit);
  }
}