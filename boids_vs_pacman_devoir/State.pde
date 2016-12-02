interface State
{
  public void doAction(Context ctx, Pacman pc);
  public void doAction(Context ctx, Boid bd);
}
class Wandering implements State 
{
  public Wandering()
  {
  }
  void doAction(Context ctx,Pacman pc)
  {
    ctx.setState(new Wandering());
    pc.wander(deltaTime);
    
  }
  void doAction(Context ctx,Boid bd)
  {
    ctx.setState(new Wandering());
    bd.c = bd.isMale? #0000AA : #AA00AA;
  }
}
class Hunting implements State 
{
  public Hunting()
  {
  }
  void doAction(Context ctx,Pacman pc)
  {
    ctx.setState(new Hunting());
    pc.hunt(deltaTime);
  }
  void doAction(Context ctx,Boid bd)
  {
    ctx.setState(new Hunting());
    bd.c = bd.isMale? #0000AA : #AA00AA;
  }
}
class Sleeping implements State 
{
  public Sleeping()
  {
  }
  void doAction(Context ctx,Pacman pc)
  {
    ctx.setState(new Sleeping());
    pc.sleep(deltaTime);
  }
  void doAction(Context ctx,Boid bd)
  {
    ctx.setState(new Sleeping());
    bd.c = bd.isMale? #0000AA : #AA00AA;
  }
}
class Pooping implements State 
{
  public Pooping()
  {
  }
  void doAction(Context ctx,Pacman pc)
  {
    ctx.setState(new Pooping());
    pc.poop(deltaTime);
  }
  void doAction(Context ctx,Boid bd)
  {
    ctx.setState(new Pooping());
    bd.c = bd.isMale? #0000AA : #AA00AA;
  }
}
class Escaping implements State 
{
  public Escaping()
  {
  }
  void doAction(Context ctx,Pacman pc)
  {
    ctx.setState(new Escaping());
  }
  void doAction(Context ctx,Boid bd)
  {
    ctx.setState(new Escaping());
    bd.c = bd.isMale? #0000AA : #AA00AA;
  }
}
class Mating implements State 
{
  public Mating()
  {
  }
  void doAction(Context ctx,Pacman pc)
  {
    ctx.setState(new Mating());
  }
  void doAction(Context ctx,Boid bd)
  {
    ctx.setState(new Mating());
    bd.c = bd.isMale? #0000AA : #AA00AA;
  }
}
class Feeding implements State 
{
  public Feeding()
  {
  }
  void doAction(Context ctx,Pacman pc)
  {
    ctx.setState(new Feeding());
  }
  void doAction(Context ctx,Boid bd)
  {
    ctx.setState(new Feeding());
    bd.c = bd.isMale? #0000AA : #AA00AA;
  }
}
class Rut implements State 
{
  public Rut()
  {
  }
  void doAction(Context ctx,Pacman pc)
  {
    ctx.setState(new Rut());
  }
  void doAction(Context ctx,Boid bd)
  {
    ctx.setState(new Rut());
    bd.c = bd.isMale? #0000FF : #FF00FF;
  }
}
class Brooding implements State 
{
  public Brooding()
  {
  }
  void doAction(Context ctx,Pacman pc)
  {
    ctx.setState(new Brooding());
  }
  void doAction(Context ctx,Boid bd)
  {
    ctx.setState(new Brooding());
    bd.c = bd.isMale? #0000AA : #AA00AA;
  }
}
class Dying implements State 
{
  public Dying()
  {
  }
  void doAction(Context ctx,Pacman pc)
  {
    ctx.setState(new Dying());
  }
  void doAction(Context ctx,Boid bd)
  {
    ctx.setState(new Dying());
    bd.c = bd.isMale? #0000AA : #AA00AA;
  }
}
class Flocking implements State 
{
  public Flocking()
  {
  }
  void doAction(Context ctx,Pacman pc)
  {
    ctx.setState(new Flocking());
  }
  void doAction(Context ctx,Boid bd)
  {
    ctx.setState(new Flocking());
    bd.c = bd.isMale? #0000AA : #AA00AA;
  }
}