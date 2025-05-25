class Obstacle {
  PVector position;
  float size;
  String type;
  PImage sprite;
  
  Obstacle(float x, float y, String obstacleType) {
    position = new PVector(x, y);
    type = obstacleType;
    loadSprite();
    
    // Set size based on type
    switch(type) {
      case "tree":
        size = 40;
        break;
      case "building":
        size = 80;
        break;
      default:
        size = 30;
    }
  }
  
  void loadSprite() {
    sprite = loadImage(type + ".png");
  }
  
  void display() {
    if (sprite != null) {
      imageMode(CENTER);
      image(sprite, position.x, position.y, size, size);
    } else {
      // Fallback shape
      fill(100);
      rect(position.x - size/2, position.y - size/2, size, size);
    }
  }
}