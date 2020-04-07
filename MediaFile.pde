// The Media File Interface, used for every Media Type.
abstract class MediaFile implements Engine_Drawable {
  
  // The Current Media.
  protected File Media;
  
  // Default Constructor.
  public MediaFile(File Media) {
    this.Media = Media;
  }

  // Draws the Display (images).
  protected abstract void DrawDisplay(PApplet App);

  // Draws the Controls (drawing).
  protected abstract void DrawControls(PApplet App);

  // The Draw Function.
  public void Draw(PApplet App) {
    // First, we update the Display.
    DrawDisplay(App);

    // Then we update the Controls.
    DrawControls(App);
  }
}
