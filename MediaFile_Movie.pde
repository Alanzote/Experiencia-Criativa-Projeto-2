// Loads up and plays Movie Files.
class MediaFile_Movie extends MediaFile {
  
  // Our Video.
  private Movie Video;
  
  // Our Buttons.
  private Engine_Button[] Buttons;
  
  // Default Constructor.
  public MediaFile_Movie(PApplet App, File Media) {
    // Super.
    super(Media);
    
    // Create Buttons.
    Buttons = new Engine_Button[] {
      new Engine_Button(10, 585, 20, 10, "Pause", (Button) -> {
        Button.Text = Video.isPlaying() ? "Play" : "Pause";
        
        if (Video.isPlaying())
          Video.pause();
        else
          Video.play();
      })
    };
    
    // Create Video.
    Video = new Movie(App, Media.getAbsolutePath());
    
    // Play.
    Video.play();
  }
  
  // Overrides Draw Display.
  protected void DrawDisplay(PApplet App) {
    // Define Image Mode.
    App.imageMode(CENTER);
    
    // Draw our Image.
    App.image(Video, App.width / 2, App.height / 2, App.width, App.width * (float)Video.sourceHeight / (float)Video.sourceWidth);
  }
  
  // Override Draw Controls.
  protected void DrawControls(PApplet App) {
     // Set the Fill color to Grey.
    App.fill(10);
    
    // Draw Background.
    App.rect(0, App.height * 0.9, App.width, App.height * 0.1);
    
    // Set the Fill Color to White.
    App.fill(255);
    
    // Draw Timeline.
    App.rect(((float)10 / (float)800) * App.width, App.height * 0.9 + App.height * 0.05, App.width - ((float)20 / (float)600) * App.width, ((float)5 / (float)600) * App.height);
    
    // Set the Fill Color to Grey.
    App.fill(40);
  
    // Draw the Timeline Position.
    App.rect(((float)10 / (float)800) * App.width + Video.time()/(float)Video.duration() * (float)(App.width - ((float)30 / (float)800) * App.width), App.height * 0.9 + App.height * 0.05 - ((float)15 / (float)600) * App.height * 0.3, ((float)15 / (float)800) * App.width, ((float)15 / (float)600) * App.height);
    
    // Draw all Buttons.
    for (Engine_Button Btn : Buttons)
      Btn.Draw(App);
  }
  
  // Called to Process Mouse Event.
  protected void ProcessMouseEvent(MouseEvent Event) {
  
  }
  
  // Called to Clean things up.
  protected void Cleanup() {
    Video.stop();
  }
}
