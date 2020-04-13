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
  
  // If we have a file, clean it up.
  if (CurrentFile != null)
    CurrentFile.Cleanup();

  // If we don't have an extension, ignore...
  if (Selected.getAbsolutePath().lastIndexOf(".") == -1 || Selected.getAbsolutePath().lastIndexOf(".") == 0)
    return;
  
  // Get the Extension.
  String Extension = Selected.getAbsolutePath().substring(Selected.getAbsolutePath().lastIndexOf(".")+1);
  
  // Load Correct Media File Type.
  if (Extension.equals("mp3") || Extension.equals("MP3") || Extension.equals("wav") || Extension.equals("WAV"))
    CurrentFile = new MediaFile_Audio(this, Selected);
  else if (Extension.equals("jpg") || Extension.equals("JPG") || Extension.equals("png") || Extension.equals("PNG"))
    CurrentFile = new MediaFile_Image(this, Selected);
  else if (Extension.equals("mov") || Extension.equals("MOV")) { }
}

// Processes Mouse Event.
void mouseEvent(MouseEvent Event) {
  // Process Mouse Event.
  if (CurrentFile != null)
    CurrentFile.ProcessMouseEvent(Event);
}

// Call Mouse Event for each Event.
void mousePressed(MouseEvent Event) { mouseEvent(Event); }
void mouseReleased(MouseEvent Event) { mouseEvent(Event); }
void mouseMoved(MouseEvent Event) { mouseEvent(Event); }
void mouseDragged(MouseEvent Event) { mouseEvent(Event); }
void mouseWheel(MouseEvent Event) { mouseEvent(Event); }

// The Draw function, draws our application.
void draw() {
  // Reset the Screen, drawing the background.
  background(0);

  if (CurrentFile != null)
    CurrentFile.Draw(this);

  // Draw Toolbar.
  Toolbar.Draw(this);
}
