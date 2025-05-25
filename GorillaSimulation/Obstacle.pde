class Obstacle {
  PVector position;
  float size;
  String type;
  color obstacleColor;
  
  Obstacle(float x, float y, String obstacleType) {
    position = new PVector(x, y);
    type = obstacleType;
    
    // Set size and color based on type
    switch(type) {
      case "tree":
        size = 40;
        obstacleColor = color(34, 139, 34); // Forest green
        break;
      case "building":
        size = 80;
        obstacleColor = color(128, 128, 128); // Gray
        break;
      default:
        size = 30;
        obstacleColor = color(100);
    }
  }
  
  
  void display() {
    pushMatrix();
    translate(position.x, position.y);
    
    switch(type) {
      case "tree":
        // Tree trunk
        fill(101, 67, 33); // Brown
        rect(-size/6, -size/2, size/3, size/2);
        
        // Tree top
        fill(obstacleColor);
        for (int i = 0; i < 3; i++) {
          triangle(
            -size/2, -size/2 + i * size/4,
            size/2, -size/2 + i * size/4,
            0, -size + i * size/4
          );
        }
        break;
        
      case "building":
        // Main building
        fill(obstacleColor);
        rect(-size/2, -size, size, size);
        
        // Windows
        fill(200, 200, 100); // Light yellow
        for (int i = 0; i < 3; i++) {
          for (int j = 0; j < 2; j++) {
            rect(
              -size/3 + j * size/2,
              -size/1.2 + i * size/3,
              size/6,
              size/6
            );
          }
        }
        break;
        
      default:
        // Generic obstacle
        fill(obstacleColor);
        rect(-size/2, -size/2, size, size);
    }
    
    popMatrix();
  }
}