import processing.sound.*;

// Loads up 
class MediaFile_Audio extends MediaFile {
  
  // Our Sound.
  private SoundFile Sound;
  
  // Our Analyzer.
  private FFT Analyzer;
  
  // The Start Play Time of this Audio File.
  private float StartTime;
  
  // The Number of Bands.
  private static final int NumberOfBands = 128;
  
  // The Band Size in X and Y.
  private static final int BandSizeX = 5, BandSizeY = 10;
  
  // The Band Smoothing Factor.
  private static final float BandSmoothFactor = 0.25;
  
  // The Bands.
  private float[] Bands = new float[NumberOfBands];
  
  // Default Constructor.
  public MediaFile_Audio(PApplet App, File Media) {
    // Super.
    super(Media);
    
    // Create Sound.
    Sound = new SoundFile(App, Media.getAbsolutePath());
    
    // Create Analyzer.
    Analyzer = new FFT(App, NumberOfBands);
    
    // Give analyzer an input.
    Analyzer.input(Sound);
    
    // Set Start Time.
    StartTime = App.millis() / 1000;
    
    // Play the Sound.
    Sound.play();
  }
  
  // Called to Update the Display.
  protected void DrawDisplay(PApplet App) {
    // Analyze.
    Analyzer.analyze();
    
    // Loop all bands...
    for (int i = 0; i < NumberOfBands; i++) {
      // Smooth Band Data.
      Bands[i] += (Analyzer.spectrum[i] - Bands[i]) * BandSmoothFactor;
      
      // Draw the Band.
      App.rect(App.width / 2 - NumberOfBands/2 * BandSizeX + BandSizeX * i, App.height / 2 + BandSizeY * 0.5, BandSizeX, -Bands[i]*BandSizeY*50);
    }
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
    App.rect(10, App.height * 0.9 + App.height * 0.05, App.width - 20, 5);
    
    // Set the Fill Color to Grey.
    App.fill(40);
  
    // Draw the Timeline Position.
    App.rect(10 + ((App.millis()/(float)1000 - StartTime)/(float)Sound.duration()) * (float)(App.width - 20), App.height * 0.9 + App.height * 0.046, 15, 15);
  }
}
