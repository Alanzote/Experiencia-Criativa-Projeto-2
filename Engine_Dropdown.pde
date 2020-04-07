// A Button with Button Children.
class Engine_Dropdown extends Engine_Button {

  // The Option Buttons.
  private Engine_Button[] OptionButtons;

  // If we are currently opened.
  public boolean IsOpened;

  // Define a Constructor.
  public Engine_Dropdown(int X, int Y, int Width, int Height, String Text, String[] Options, Consumer<Engine_Button> Callback) {
    // Super it.
    super(X, Y, Width, Height, Text, Callback);

    // If we don't have any options, just ignore.
    if (Options == null)
      return;

    // Create Option Buttons.
    OptionButtons = new Engine_Button[Options.length];

    // Loop all options, create button.
    for (int i = 0; i < Options.length; i++)
      OptionButtons[i] = new Engine_Button(X, Y + Height * (i + 1), Width, Height, Options[i], Callback);
  }

  // Override Draw.
  public void Draw(PApplet App) {
    // Super Draw.
    super.Draw(App);

    // Update IsOpened.
    if (IsPressedOnce)
      IsOpened = !IsOpened;

    // Check for Open, draw other Buttons if we are opened.
    if (IsOpened)
      for (Engine_Button Btn : OptionButtons)
        Btn.Draw(App);
  }
}
