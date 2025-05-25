class Gorilla extends Entity {
  float attackRange;
  float attackDamage;
  
  Gorilla(float x, float y) {
    super(x, y);
    size = 40;
    health = 200;
    speed = 2;
    attackRange = 50;
    attackDamage = 25;
  }
  
  
  void update() {
    // Find nearest human
    Human target = findNearestHuman();
    
    if (target != null) {
      // Move towards target
      PVector direction = PVector.sub(target.position, position);
      direction.normalize();
      direction.mult(speed);
      velocity = direction;
      
      // Attack if in range
      if (PVector.dist(position, target.position) < attackRange) {
        attack(target);
      }
    }
    
    // Update position
    position.add(velocity);
    
    // Keep within bounds
    position.x = constrain(position.x, 0, width);
    position.y = constrain(position.y, 0, height);
  }
  
  void display() {
    // Draw gorilla using shapes
    pushMatrix();
    translate(position.x, position.y);
    
    // Body
    fill(100, 60, 20);
    ellipse(0, 0, size, size);
    
    // Arms
    ellipse(-size/2, 0, size/2, size/3);
    ellipse(size/2, 0, size/2, size/3);
    
    // Head
    ellipse(0, -size/3, size/2, size/2);
    
    // Face
    fill(60, 30, 10);
    ellipse(0, -size/3, size/3, size/3);
    
    popMatrix();
  }
  
  void attack(Human target) {
    target.takeDamage(attackDamage);
  }
  
  Human findNearestHuman() {
    float minDist = Float.MAX_VALUE;
    Human nearest = null;
    
    for (Human h : humans) {
      if (!h.isDead()) {
        float d = PVector.dist(position, h.position);
        if (d < minDist) {
          minDist = d;
          nearest = h;
        }
      }
    }
    
    return nearest;
  }
}