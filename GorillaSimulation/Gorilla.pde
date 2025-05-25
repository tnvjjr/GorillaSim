class Gorilla extends Entity {
  PImage sprite;
  float attackRange;
  float attackDamage;
  
  Gorilla(float x, float y) {
    super(x, y);
    size = 40;
    health = 200;
    speed = 2;
    attackRange = 50;
    attackDamage = 25;
    loadSprite();
  }
  
  void loadSprite() {
    // Load gorilla sprite image
    sprite = loadImage("gorilla.png");
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
    if (sprite != null) {
      imageMode(CENTER);
      image(sprite, position.x, position.y, size, size);
    } else {
      // Fallback shape if sprite not loaded
      fill(100, 60, 20);
      ellipse(position.x, position.y, size, size);
    }
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