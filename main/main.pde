// Import the Sound library to handle audio playback
import processing.sound.*;

// This is the variables for the audio file and buttons
SoundFile file;        // This variable will hold our audio file
Button playButton;      // Button to play or pause the audio
Button breathingButton;    // Button to start or stop the breathing exercise


// Variables to control the breathing exercise
boolean breathingActive = false;     
int breatheStage = 0;
int breatheCount = 0;

// The setup function runs once when the program starts
void setup() {
   // Set the size of the window to 640 pixels wide by 400 pixels high
  size(640, 400);
    // Load the audio file from the specified path
  file = new SoundFile(this, "stuff/song.wav");  
  // Create the play button at (100, 100) with width 100, height 50, and label "Play"
  playButton = new Button(100, 100, 100, 50, "Play", 300, 200, 200);
   // Create the breathing button at (100, 200) with width 200, height 50, and label "Start Breathing"
  breathingButton = new Button(100, 200, 200, 50, "Start Breathing", 150, 150, 250);
}

// The draw function loops continuously to update and display content
void draw() {
   // Set the background color to white
  background(255);
  // Check if the play/pause button is clicked
  if (playButton.isClicked()) {
     // If clicked, toggle the audio playback (play or pause)
    togglePlayPause();
  }

  // Check if breathing button is clicked
  if (breathingButton.isClicked()) {
    breathingActive = !breathingActive; // Toggle breathing exercise
    breatheStage = 0;                   // Reset breathing cycle
    breatheCount = 0;                   // Reset count
  }

// Update and display the play button
  playButton.update();
  playButton.render();
  // Update and display the breathing button
  breathingButton.update();
  breathingButton.render();

  // If the breathing exercise is active, run the displayBreathing function
  if (breathingActive) {
    displayBreathing();
  }
}

// This function toggles the play/pause state of the audio file
void togglePlayPause() {
   // Check if the audio file is currently playing
  if (file.isPlaying()) {
    // If it is, pause the audio and change the button text to "Play"
    file.pause();
    playButton.setText("Play");
  } else {
    // If it’s not playing, start the audio and change the button text to "Pause"
    file.play();
    playButton.setText("Pause");
  }
}



// Display breathing instructions
void displayBreathing() {
  fill(0);                    // Set text color to black
  textAlign(300, 500);        //Position of the text on the screen
  textSize(32);               // Set the text size


  // Control timing by frame count
  if (frameCount % 60 == 0) {  // Every 60 frames (1 second)
    breatheCount++;             

//if breatheCount exceeds 5 seconds, switch breathing stages
    if (breatheCount > 5) {     // Switch between "in" and "out" every 5 counts
      breatheCount = 1;
      breatheStage = (breatheStage + 1) % 2; 
    }
  }
  
  
// Display text based on breathing stage (0 for "in", 1 for "out")
  if (breatheStage == 0) {
    text("Breathe In... " + breatheCount, width / 2, height / 2);
  } else {
    text("Breathe Out... " + breatheCount, width / 2, height / 2);
  }
}
