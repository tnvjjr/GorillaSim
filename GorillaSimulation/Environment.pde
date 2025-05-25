class Environment {
  String type;
  ArrayList<Obstacle> obstacles;
  color backgroundColor;
  color obstacleColor;
  
  Environment(String environmentType) {
    type = environmentType;
    obstacles = new ArrayList<Obstacle>();
    setEnvironmentColors();
    generateObstacles();
  }
  
  void setEnvironmentColors() {
    switch(type) {
      case "jungle":
        backgroundColor = color(34, 139, 34); // Forest green
        obstacleColor = color(101, 67, 33);   // Dark brown
        break;
      case "urban":
        backgroundColor = color(169, 169, 169); // Gray
        obstacleColor = color(105, 105, 105);   // Dark gray
        break;
      case "arena":
        backgroundColor = color(210, 180, 140); // Tan
        obstacleColor = color(139, 69, 19);     // Saddle brown
        break;
      default:
        backgroundColor = color(220);
        obstacleColor = color(100);
    }
  }
  
  void generateObstacles() {
    // Add environment-specific obstacles
    switch(type) {
      case "jungle":
        for (int i = 0; i < 20; i++) {
          obstacles.add(new Obstacle(random(width), random(height), "tree"));
        }
        break;
      case "urban":
        for (int i = 0; i < 15; i++) {
          obstacles.add(new Obstacle(random(width), random(height), "building"));
        }
        break;
      case "arena":
        // Add arena walls
        break;
    }
  }
  
  void display() {
    // Draw background
    background(backgroundColor);
    
    // Add some random shapes for texture based on environment
    noStroke();
    fill(lerpColor(backgroundColor, color(255), 0.1));
    
    for (int i = 0; i < 50; i++) {
      float x = random(width);
      float y = random(height);
      
      switch(type) {
        case "jungle":
          // Random leaves
          pushMatrix();
          translate(x, y);
          rotate(random(TWO_PI));
          ellipse(0, 0, 20, 40);
          popMatrix();
          break;
          
        case "urban":
          // Random windows
          rect(x, y, 10, 10);
          break;
          
        case "arena":
          // Random sand patterns
          circle(x, y, 5);
          break;
      }
    }
    
    // Display obstacles
    for (Obstacle obstacle : obstacles) {
      obstacle.display();
    }
  }
}