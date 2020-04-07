import processing.core.PApplet;

// The Toolbar.
Engine_Toolbar Toolbar;

// The Media File.
MediaFile CurrentFile;

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

  // Create Toolbar.
  Toolbar = new Engine_Toolbar(new Engine_ToolbarElement("File", new String[] { "Open" }, (Button) -> {
    // If we aren't the Open, ignore...
    if (Button.Text != "Open")
      return;
    
    // Select Input.
    selectInput("Select a Media File:", "OnMediaFileSelected");
  }), new Engine_ToolbarElement("Help", (Button) -> {
    // Print Help.
    println("Help Pressed");
  }));
}

// Called when a file is selected.
void OnMediaFileSelected(File Selected) {
  // If we didn't select anything, ignore.
  if (Selected == null)
    return;

  CurrentFile = new MediaFile_Audio(this, Selected);
}

// The Draw function, draws our application.
void draw() {
  // Reset the Screen, drawing the background.
  background(0);
  
  if (CurrentFile != null)
    CurrentFile.Draw(this);

  // Draw Toolbar.
  Toolbar.Draw(this);
}
