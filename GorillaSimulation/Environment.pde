class Environment {
  String type;
  ArrayList<Obstacle> obstacles;
  PImage backgroundImage;
  
  Environment(String environmentType) {
    type = environmentType;
    obstacles = new ArrayList<Obstacle>();
    loadEnvironment();
  }
  
  void loadEnvironment() {
    // Load background image based on environment type
    backgroundImage = loadImage(type + "_bg.png");
    
    // Create obstacles based on environment type
    generateObstacles();
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
    if (backgroundImage != null) {
      image(backgroundImage, 0, 0, width, height);
    }
    
    // Display obstacles
    for (Obstacle obstacle : obstacles) {
      obstacle.display();
    }
  }
}