void createGUI() {
  controlWindow = GWindow.getWindow(this, "Simulation Controls", 50, 50, 300, 400, JAVA2D);
  controlWindow.addDrawHandler(this, "windowDraw");
  
  // Create sliders
  GSlider humanSlider = new GSlider(controlWindow, 10, 20, 280, 20, 10);
  humanSlider.setLimits(DEFAULT_HUMANS, 1, 200);
  
  GSlider gorillaSlider = new GSlider(controlWindow, 10, 60, 280, 20, 10);
  gorillaSlider.setLimits(DEFAULT_GORILLAS, 1, 5);
  
  // Create environment dropdown
  GDropList environmentList = new GDropList(controlWindow, 10, 100, 150, 100);
  environmentList.setItems(new String[] {"jungle", "urban", "arena"}, 0);
  
  // Create other control elements
  // ... Add more GUI controls here
}

void windowDraw(PApplet app, GWinData data) {
  app.background(230);
  app.fill(0);
  app.text("Number of Humans:", 10, 15);
  app.text("Number of Gorillas:", 10, 55);
  app.text("Environment:", 10, 95);
}