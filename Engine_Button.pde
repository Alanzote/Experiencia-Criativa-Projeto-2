// A Simple button.
class Engine_Button implements Engine_Drawable {

  // The Position of this Button.
  public int X; // From 0-800, on multiple screen sizes, this is recalculated.
  public int Y; // From 0-600, on multiple screen sizes, this is recalculated.

  // The Width and Height of this Button.
  public int Width; // From 0-800, on multiple screen sizes, this is recalculated.
  public int Height; // From 0-600, on multiple screen sizes, this is recalculated.

  // The Text of this Button.
  public String Text;

  // If this Button is pressed.
  public boolean IsPressed;
  
  // If this Button is hovered.
  public boolean IsHovered;
  
  // Define a Constructor.
  public Engine_Button(int X, int Y, int Width, int Height, String Text) {
    this.X = X;
    this.Y = Y;
    this.Width = Width;
    this.Height = Height;
    this.Text = Text;
  }

  // Draws the Button.
  public void Draw(PApplet App) {
    // Calculate Parameters.
    int RealX = (int)((X / (float)800) * App.width);
    int RealY = (int)((Y / (float)600) * App.height);
    int RealWidth = (int)((Width / (float)800) * App.width);
    int RealHeight = (int)((Height / (float)600) * App.height);
     
    // Do State Checks.
    IsHovered = App.mouseX >= RealX && App.mouseX < RealX + RealWidth && App.mouseY >= RealY && App.mouseY < RealY + RealHeight;
    IsPressed = IsHovered && App.mousePressed && App.mouseButton == LEFT;
   
    // Fill with Color.
    App.fill(IsPressed ? 60 : IsHovered ? 40 : 20);

    // Draw the Rectangle.
    App.rect(RealX, RealY, RealWidth, RealHeight);

    // Fill with White.
    App.fill(255);

    // Draw the Text.
    App.text(Text, RealX + RealWidth * 0.1, RealY + RealHeight * 0.6);
  }
}
