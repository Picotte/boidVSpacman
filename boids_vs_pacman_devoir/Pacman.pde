
class Pacman extends Predator {
  //Variables du Pacman
  
  
  
  
  float upperLip, lowerLip;
  
  float upperLipClosed = PI / 180;
  float lowerLipClosed = TWO_PI - (PI / 180);
  float lowerLipOpen = 7 * QUARTER_PI;
  
  color normalColor = color (255, 238, 0);
  color huntingColor = color (255, 100, 0);
  color fillColor = normalColor;
  
  int currentframe = 0;

  int animationDelay = 500;
  int animationAcc = 0;
  
    
  float topSteer = 0.3;
  
  //boolean sleeping = false;
  //int sleepingAcc = 0;
  //int sleepingTime = 15000;
  
  Delay sleepingTime = new Delay (2000);
  Delay poopingTime = new Delay (1000);
  Delay wanderingTime = new Delay (5000);
  
  boolean debugMode = false;
  
  Pacman (PVector location, PVector size, World world) {
    super (world);
    this.location = location;
    this.size = size;
    
    velocity = new PVector (3, 3);
    
    preyingDistance = size.mag() * 5;
    
    target.x = random (width);
    target.y = random (height);
  }
  
  //Dessiner le pacman avec les animations
  void display()
  {
    pushMatrix();
    
    stroke(0);
    translate(location.x, location.y);
    
    if (ctx.getState().equals(Sleeping.class)) {
      fill (50);
      text ("Zzzz...", size.x / 2, -size.y / 2);
      noFill();
      ellipse (size.x - 10, -size.y / 2 - 3, size.x, size.y / 2);
    } else {
      rotate(angle);
    }
    
    fill(fillColor);
    arc(0, 0, size.x, size.y, upperLip, lowerLip, PIE);
    popMatrix();
    
    if (debugMode) {
      debug();
    }
  }
  
  void debug() {
    if (target != null) {
      stroke (#c40000);
      noFill();
      ellipse (target.x, target.y, 50, 50);
    }
  }
  
  void setTarget (float x, float y) {
    target.x = x;
    target.y = y;
  }
  
  void update(float deltaTime) {   
    animationAcc += deltaTime;
    
    ctx.getState().doAction(ctx, this);
    
    
    if (animationAcc >= animationDelay) {
      animationAcc = 0;
      
      if (ctx.getState().equals(Sleeping.class)) {
        currentframe = 0;
      } else {
        currentframe = ((currentframe + 1) % 2);
      }
    }
    
    if(currentframe == 0) {
      upperLip = upperLipClosed;
      lowerLip = lowerLipClosed;
    } else {
      upperLip = QUARTER_PI;
      lowerLip = lowerLipOpen;  
    }
    /** END : ANIMATION BLOCK **/

  }
  
  void wander(float deltaTime) {
    if(topSpeed == 3)
    {
      topSpeed = 3;
    }
    if (!wanderingTime.expired()) {
      if (moveToTarget()) {
        setTarget(random (width - (2 * size.x)), random(height - (2* size.y)));
      }
      wanderingTime.update(deltaTime);
    } else {
      ctx.setState(new Hunting());
    }
  }

  

  
  void hunt (float deltaTime) {
    if (preys.size() == 0) {
      ctx.setState(new Wandering());
      isChasing = false;
      //sleeping = true;
      preysEaten = 0;
      fillColor = normalColor;
      
      return;
    }
    
      topSpeed = 5;  
      if (!isChasing) {
      closestPrey = seekPrey();
      setPrey (closestPrey);
      isChasing = true;
      
      
    } else {
      target = prey.location;
      boolean captured = moveToTarget();
      
      if (captured) {
        preysEaten+=map (prey.getEnergy(), 0, 500, 1, 4);
        size.x+=map (prey.getEnergy(), 0, 500, 1, 4);
        size.y+=map (prey.getEnergy(), 0, 500, 1, 4);
        topSpeed+=0.5;
        preys.remove(prey);
        isChasing = false;
        
      } else {
        if (prey.hasEscaped) {
          isChasing = false;
        }
      }
    }
    
    if (preysEaten > preysLimit) {
      ctx.setState(new Sleeping());
      //isHunting = false;
      isChasing = false;
      //sleeping = true;
      preysEaten = 0;
      size.x = 50;
      size.y = 50;
      incLimit();
      fillColor = normalColor;
    }
  }
  
  void setPrey (int preyIndex) {
    prey = preys.get(preyIndex);
    setTarget (prey.location.x, prey.location.y);   
  }
  
  int seekPrey() {

    float minDistance = width * height;
   
    for (int i = 0; i < preys.size(); i++ ) {
      Mover current = preys.get(i);
      
      float distance = PVector.dist(current.location, location);
      
      if (distance < minDistance) {
        minDistance = distance;
        closestPrey = i;
      }      
    }
    
    if (preys.size() == 0) {
      closestPrey = -1;
    }
    
    return closestPrey;
  }
  
  boolean toggleHunting() {
    if (!ctx.getState().equals(Hunting.class)) {
      
      ctx.setState(new Hunting());
    } else {
      ctx.setState(new Wandering());
    }
    
    return ctx.getState().equals(Hunting.class);
  }
  
  void setPreys(ArrayList<Boid> preys) {
    this.preys = preys;
  }
  
  void poop(float deltaTime) {
    
    if (!poopingTime.expired()){
      fillColor = color (200, 0, 0);
      poopingTime.update(deltaTime);
    } else {
      poops.add(new Food (location.x, location.y, this.world));
      ctx.setState(new Wandering());
      fillColor = normalColor;
    }
  }
  
  void sleep (float deltaTime) {
    if (!sleepingTime.expired()) {
      fillColor = color (200, 200, 200);
      sleepingTime.update(deltaTime);
    } else {
      ctx.setState(new Pooping());
    }
    /*
    sleepingAcc += deltaTime;
    if (sleepingAcc > sleepingTime) {
      sleepingAcc = 0;
      //sleeping = false;
      state = State.POOPING;
    }
    */
  }

}