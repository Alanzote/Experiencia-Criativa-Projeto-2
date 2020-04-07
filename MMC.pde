import processing.core.PApplet;

Engine_Dropdown Btn;

// The Settings function, called before setup.
void settings() {
  size(800, 600);
}

// The setup function, sets default values.
void setup() {
  // Set Surface Title.
  surface.setTitle("MMC");
  
  // Make sure Surface is resizable.
  surface.setResizable(true);
  
  Btn = new Engine_Dropdown(0, 0, 30, 10, "File", new String[] { "Open" });
}

// The Draw function, draws our application.
void draw() {
  // Reset the Screen, drawing the background.
  background(0);
  
  Btn.Draw(this);
}
