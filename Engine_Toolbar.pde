// Contains all Information about a Toolbar Element.
class Engine_ToolbarElement {
  // The Text of this Element.
  public String Text;
  
  // The Children of this Element (If non-null, creates a dropdown).
  public String[] Children;
  
  // The Callback of this Element.
  public Consumer<Engine_Button> Callback;
  
  // Creates a non-dropdown element.
  public Engine_ToolbarElement(String Text, Consumer<Engine_Button> Callback) {
    this.Text = Text;
    this.Callback = Callback;
  }
  
  // Creates a dropdown element.
  public Engine_ToolbarElement(String Text, String[] Children, Consumer<Engine_Button> Callback) {
    this.Text = Text;
    this.Children = Children;
    this.Callback = Callback;
  }
}

// A toolbar, containing several buttons or dropdowns. 
class Engine_Toolbar implements Engine_Drawable {
  
  // The elements on this toolbar.
  private Engine_Drawable[] Elements;
  
  // Default Constructor.
  public Engine_Toolbar(Engine_ToolbarElement ... Elements) {
    // Create Elements.
    this.Elements = new Engine_Drawable[Elements.length];
    
    // Loop all Elements...
    for (int i = 0; i < Elements.length; i++) {
      // Our Drawable Element.
      Engine_Drawable ThisElement = null;
      
      // Create Dropdown or Button.
      if (Elements[i].Children != null)
        ThisElement = new Engine_Dropdown(2 + 30 * i, 3, 30, 10, Elements[i].Text, Elements[i].Children, Elements[i].Callback);
      else
        ThisElement = new Engine_Button(2 + 30 * i, 3, 30, 10, Elements[i].Text, Elements[i].Callback);
      
      // Add the Element.
      this.Elements[i] = ThisElement;
    }
  }
  
  // Draws the toolbar.
  public void Draw(PApplet App) {
    // Set the Fill color to Grey.
    App.fill(10);
    
    // Draw background.
    App.rect(0, 0, App.width, App.height * 0.025);
    
    // Draw Elements.
    for (Engine_Drawable Element : Elements)
      Element.Draw(App);
  }
}
