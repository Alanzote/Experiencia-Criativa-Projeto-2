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

  // Create Button with Callback.
  Btn = new Engine_Dropdown(0, 0, 30, 10, "File", new String[] { "Open" }, (Button) -> {
    // If we aren't the Open, ignore...
    if (Button.Text != "Open")
      return;
      
    selectInput("Select a Media File:", "OnMediaFileSelected");
  });
}

// Called when a file is selected.
void OnMediaFileSelected(File Selected) {
  println(Selected.getAbsolutePath());
}

// The Draw function, draws our application.
void draw() {
  // Reset the Screen, drawing the background.
  background(0);

  Btn.Draw(this);
}
