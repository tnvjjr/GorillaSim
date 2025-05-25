class Entity {
  PVector position;
  PVector velocity;
  float health;
  float speed;
  float size;
  float aggressionLevel;
  
  Entity(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    health = 100;
    speed = 2;
    size = 30;
    aggressionLevel = 0.5;
  }
  
  void update() {
    // Default update behavior
    position.add(velocity);
    position.x = constrain(position.x, 0, width);
    position.y = constrain(position.y, 0, height);
  }
  
  void display() {
    // Default display behavior
    fill(150);
    ellipse(position.x, position.y, size, size);
  }
  
  boolean isColliding(Entity other) {
    float distance = PVector.dist(position, other.position);
    return distance < (size + other.size) / 2;
  }
  
  void takeDamage(float amount) {
    health -= amount;
    if (health < 0) health = 0;
  }
  
  boolean isDead() {
    return health <= 0;
  }
}