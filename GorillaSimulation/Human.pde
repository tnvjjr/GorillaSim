class Human extends Entity {
  PImage sprite;
  
  Human(float x, float y) {
    super(x, y);
    size = 20;
    health = 50;
    speed = 3;
    loadSprite();
  }
  
  void loadSprite() {
    // Load human sprite image
    sprite = loadImage("human.png");
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
    if (sprite != null) {
      imageMode(CENTER);
      image(sprite, position.x, position.y, size, size);
    } else {
      // Fallback shape if sprite not loaded
      fill(200, 150, 150);
      ellipse(position.x, position.y, size, size);
    }
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