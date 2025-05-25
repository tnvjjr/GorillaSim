import g4p_controls.*;

// Constants
final int DEFAULT_HUMANS = 100;
final int DEFAULT_GORILLAS = 1;

// Game state
ArrayList<Human> humans;
ArrayList<Gorilla> gorillas;
Environment environment;
SimulationStats stats;

// GUI Window
GWindow controlWindow;

void setup() {
  size(1200, 800);
  createGUI();
  initializeSimulation();
}

void draw() {
  background(220);
  
  // Update and display environment
  environment.display();
  
  // Update and display entities
  for (Human human : humans) {
    human.update();
    human.display();
  }
  
  for (Gorilla gorilla : gorillas) {
    gorilla.update();
    gorilla.display();
  }
  
  // Display stats
  stats.display();
}

void initializeSimulation() {
  humans = new ArrayList<Human>();
  gorillas = new ArrayList<Gorilla>();
  environment = new Environment("jungle");
  stats = new SimulationStats();
  
  // Initialize entities
  for (int i = 0; i < DEFAULT_HUMANS; i++) {
    humans.add(new Human(random(width), random(height)));
  }
  
  for (int i = 0; i < DEFAULT_GORILLAS; i++) {
    gorillas.add(new Gorilla(random(width), random(height)));
  }
}