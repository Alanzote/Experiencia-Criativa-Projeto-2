import ddf.minim.*;
import ddf.minim.analysis.*;

// Loads up and plays audio files.
class MediaFile_Audio extends MediaFile {
  
  // Minim.
  private Minim Library;
  
  // Our Sound.
  private AudioPlayer Sound;
  
  // Our Analyzer.
  private FFT Analyzer;
  
  // The Band Size in X and Y.
  private static final int BandSizeX = 2, BandSizeY = 5;
  
  // The Amount of Bands.
  private static final int BandAmount = 256;
  
  // The Band Skip Ratio.
  private static final int BandSkip = 3;
  
  // Our Buttons.
  private Engine_Button[] Buttons;
  
  // Default Constructor.
  public MediaFile_Audio(PApplet App, File Media) {
    // Super.
    super(Media);
    
    // Create Buttons.
    Buttons = new Engine_Button[] {
      new Engine_Button(10, 585, 20, 10, "Pause", (Button) -> {
        Button.Text = Sound.isPlaying() ? "Play" : "Pause";
        
        if (Sound.isPlaying())
          Sound.pause();
        else
          Sound.play();
      }),
      new Engine_Button(35, 585, 20, 10, "Rewind", (Button) -> {
        Sound.rewind();
      }),
      new Engine_Button(60, 585, 20, 10, "Loop", (Button) -> {
        Button.Text = Sound.isLooping() ? "Loop" : "Stop Loop";
        
        if (Sound.isLooping())
          Sound.loop(1);
        else
          Sound.loop();
      })
    };
    
    // Create Minim.
    Library = new Minim(App);
    
    // Create Sound.
    Sound = Library.loadFile(Media.getAbsolutePath(), 1024);
    
    // Create Analyzer.
    Analyzer = new FFT(Sound.bufferSize(), Sound.sampleRate());
    
    // Play the Sound.
    Sound.play();
  }
  
  // Called to Update the Display.
  protected void DrawDisplay(PApplet App) {
    // Analyze.
    Analyzer.forward(Sound.mix);
    
    // Calculate Real Sizes.
    int RealSizeX = (int)Math.max(2, ((float)BandSizeX/(float)800 * App.width));
    int RealSizeY = (int)((float)BandSizeY/(float)600 * App.height);
    
    // Loop all bands...
    for (int i = 0; i < BandAmount; i++)
      App.rect(App.width / 2 - BandAmount/2 * RealSizeX + RealSizeX * i, App.height / 2 + RealSizeY * 0.5, RealSizeX, -Analyzer.getBand(i + BandSkip)*RealSizeY);
  }
  
  // Called to Update the Controls.
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
    App.rect(((float)10 / (float)800) * App.width + ((float)Sound.position()/(float)Sound.length()) * (float)(App.width - ((float)30 / (float)800) * App.width), App.height * 0.9 + App.height * 0.05 - ((float)15 / (float)600) * App.height * 0.3, ((float)15 / (float)800) * App.width, ((float)15 / (float)600) * App.height);
    
    // Draw all Buttons.
    for (Engine_Button Btn : Buttons)
      Btn.Draw(App);
  }
  
  // Processes a Mouse event.
  protected void ProcessMouseEvent(MouseEvent Event) {
  
  }
  
  // Clean up.
  protected void Cleanup() {
    // Pause the Sound.
    Sound.pause();
    
    // Close it.
    Sound.close();
    
    // Stop Minim.
    Library.stop();
  }
}
