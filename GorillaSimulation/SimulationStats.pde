class SimulationStats {
  int humansAlive;
  int gorillasAlive;
  float simulationTime;
  
  SimulationStats() {
    reset();
  }
  
  void reset() {
    humansAlive = humans.size();
    gorillasAlive = gorillas.size();
    simulationTime = 0;
  }
  
  void update() {
    humansAlive = countAliveHumans();
    gorillasAlive = countAliveGorillas();
    simulationTime += 1.0/frameRate;
  }
  
  void display() {
    fill(0);
    textSize(16);
    text("Humans Alive: " + humansAlive, 10, 30);
    text("Gorillas Alive: " + gorillasAlive, 10, 50);
    text("Time: " + nf(simulationTime, 0, 1) + "s", 10, 70);
  }
  
  int countAliveHumans() {
    int count = 0;
    for (Human h : humans) {
      if (!h.isDead()) count++;
    }
    return count;
  }
  
  int countAliveGorillas() {
    int count = 0;
    for (Gorilla g : gorillas) {
      if (!g.isDead()) count++;
    }
    return count;
  }
}