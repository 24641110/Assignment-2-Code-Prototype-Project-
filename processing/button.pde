// Define a class to represent a button with position, size, color, and label
class Button {
  PVector pos = new PVector(0, 0); // Position of the button
  float width, height;             // Width and height of the button
  color colour;                    // Colour of the button also i changed it to colour because we're Australian
  String Text;                     // Text label of the button
  boolean pressed = false;         // Is the button currently pressed?
  boolean clicked = false;         // Has the button been clicked?

  // Constructor to create a button with specific properties
  Button(int x, int y, int w, int h, String t, int r, int g, int b) {
    pos.x = x;             // Set x-position
    pos.y = y;             // Set y-position
    width = w;             // Set width
    height = h;            // Set height
    colour = color(r, g, b); // Set color using RGB values
    Text = t;              // Set the label text
  }

  // Update the button's state based on mouse input
  void update() {
    // Check if the mouse is pressed and the cursor is over the button
    if (mousePressed && !pressed && overButton()) {
      clicked = true;      // Mark the button as clicked
      pressed = true;      // Mark the button as pressed
    } else if (!mousePressed) {
      pressed = false;     // Reset pressed state if the mouse is released
      clicked = false;     // Reset clicked state
    }
    
    
  }
  // Render (draw) the button on the screen
  void render() {
    fill(colour);                 // Set the fill color of the button
    rect(pos.x, pos.y, width, height); // Draw the button rectangle

    fill(0);                      // Set text color to black
    textAlign(CENTER, CENTER);    // Center the text inside the button
    text(Text, pos.x + width / 2, pos.y + height / 2); // Draw the text
  }

  // Check if the button was clicked in this frame
  boolean isClicked() {
    return clicked;
  }

  // Change the button's text to a new label
  void setText(String newText) {
    this.Text = newText;
  }

  // Check if the mouse cursor is over the button area
  boolean overButton() {
    return mouseX >= pos.x && mouseX <= pos.x + width && mouseY >= pos.y && mouseY <= pos.y + height;
  }
}
