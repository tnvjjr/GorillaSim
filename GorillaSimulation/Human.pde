class Human extends Entity {
  Human(float x, float y) {
    super(x, y);
    size = 20;
    health = 50;
    speed = 3;
  }
  
  
  void update() {
    // Check for nearby gorillas
    Gorilla nearestGorilla = findNearestGorilla();
    
    if (nearestGorilla != null) {
      // Flee from gorilla
      PVector fleeDirection = PVector.sub(position, nearestGorilla.position);
      fleeDirection.normalize();
      fleeDirection.mult(speed);
      velocity = fleeDirection;
    }
    
    // Update position
    position.add(velocity);
    
    // Keep within bounds
    position.x = constrain(position.x, 0, width);
    position.y = constrain(position.y, 0, height);
  }
  
  void display() {
    // Draw human using shapes
    pushMatrix();
    translate(position.x, position.y);
    
    // Body
    fill(200, 150, 150);
    rect(-size/4, -size/4, size/2, size/2);
    
    // Head
    ellipse(0, -size/2, size/2, size/2);
    
    // Arms
    rect(-size/2, -size/4, size/4, size/3);
    rect(size/4, -size/4, size/4, size/3);
    
    // Legs
    rect(-size/4, size/4, size/4, size/3);
    rect(0, size/4, size/4, size/3);
    
    popMatrix();
  }
  
  Gorilla findNearestGorilla() {
    float minDist = Float.MAX_VALUE;
    Gorilla nearest = null;
    
    for (Gorilla g : gorillas) {
      float d = PVector.dist(position, g.position);
      if (d < minDist) {
        minDist = d;
        nearest = g;
      }
    }
    
    return nearest;
  }
}