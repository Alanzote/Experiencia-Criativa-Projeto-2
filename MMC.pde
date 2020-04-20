import processing.core.PApplet;
import processing.video.*;
import java.nio.file.*;

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
  
  // Try...
  try {
    // Get Content Type.
    String ContentType = Files.probeContentType(Paths.get(Selected.getAbsolutePath()));
    
    // Audio Image and Video load.
    if (ContentType.contains("audio"))
      CurrentFile = new MediaFile_Audio(this, Selected);
    else if (ContentType.contains("image"))
      CurrentFile = new MediaFile_Image(this, Selected);
    else if (ContentType.contains("video"))
      CurrentFile = new MediaFile_Movie(this, Selected);
  } catch (Exception ex) {
    // Notify.
    println("-- ERROR WHILE LOADING FILE --");
    println(ex.getMessage());
  }
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

// Define Movie Event.
void movieEvent(Movie m) { m.read(); }

// The Draw function, draws our application.
void draw() {
  // Reset the Screen, drawing the background.
  background(0);
  
  // Draw Current File, if it exists.  
  if (CurrentFile != null)
    CurrentFile.Draw(this);

  // Draw Toolbar.
  Toolbar.Draw(this);
}
