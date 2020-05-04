// Loads up and Displays Image Files.
class MediaFile_Image extends MediaFile {

  // The Image.
  private PImage Image;

  // The Zoom.
  private float Zoom = 1;

  // If we are dragging the Image.
  private boolean IsDragging = false;

  // The Image Offset.
  private int ImageOffsetX = 0, ImageOffsetY = 0;

  // Default Constructor.
  public MediaFile_Image(PApplet App, File Media) {
    // Super.
    super(Media);

    // Load Image.
    Image = App.loadImage(Media.getAbsolutePath());
  }

  // Overrides Draw Display.
  protected void DrawDisplay(PApplet App) {
    // Set Image Mode.
    App.imageMode(CENTER);

    // Draw the Image.
    App.image(Image, App.width / 2 + ImageOffsetX, App.height / 2 + ImageOffsetY, Image.width * Zoom, Image.height * Zoom);
  }

  // Overrides Draw Controls.
  protected void DrawControls(PApplet App) {
    // Set if we are dragging the image.
    IsDragging = App.mousePressed && App.mouseButton == LEFT && App.mouseX >= App.width / 2 - Image.width / 2 + ImageOffsetX && App.mouseX <= App.width / 2 + Image.width / 2 + ImageOffsetX && App.mouseY >= App.height / 2 - Image.height /2 + ImageOffsetY && App.mouseY <= App.height / 2 + Image.height / 2 + ImageOffsetY;

    // If we are dragging.
    if (IsDragging) {
      // Increment Offset X.
      ImageOffsetX += App.mouseX - App.pmouseX;

      // Increment Offset Y.
      ImageOffsetY += App.mouseY - App.pmouseY;
    }
  }
  
  // Called to Process Mouse Event.
  protected void ProcessMouseEvent(MouseEvent Event) {
    // If it isn't the mouse wheel, ignore.
    if (Event.getAction() != MouseEvent.WHEEL)
      return;
      
    // Set Zoom.
    Zoom = Math.max(0.25, Math.min(3, Zoom + Event.getCount() * 0.25));
  }

  // Called to Clean things up.
  protected void Cleanup() {
  }
}
