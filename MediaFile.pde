// The Media File Interface, used for every Media Type.
abstract class MediaFile implements Engine_Drawable {

  // Updates the Display (images).
  protected abstract void UpdateDisplay(PApplet App);

  // Updates the Controls (drawing).
  protected abstract void UpdateControls(PApplet App);

  // The Draw Function.
  public void Draw(PApplet App) {
    // First, we update the Display.
    UpdateDisplay(App);

    // Then we update the Controls.
    UpdateControls(App);
  }
}
