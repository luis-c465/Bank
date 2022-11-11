import gifAnimation.*;
import processing.sound.*;

// * CONSTANTS
final int NUM_QUESTIONS = 0;

// ! This size is set to avoid issues where the program wont fit on the screen of school computers
final int WINDOW_SIZE = 1_000;


// * CLASSES

Stor stor = new Stor();
Gif dripGif;
PFont mono;

Test t = new Test(NUM_QUESTIONS );

TransitionIn transitionIn;
TransitionOut transitionOut;

//  * GLOBAL VARIABLES
int curMazeNum = 0;
boolean didDeath = false;
boolean levelTransition = false;
boolean intro = true;
boolean introTransition = false;
boolean winner = false;

void settings() {
  size(WINDOW_SIZE, WINDOW_SIZE);
}

void setup() {
  background(255);
  shapeMode(CENTER);
  textAlign(CENTER);

  transitionIn = new TransitionIn();
  transitionOut = new TransitionOut();

  stor._setup(this);

  // TODO: Replace this with a solid sans font from google fonts
  mono = createFont("fonts/ThaleahFat.ttf", 64);
  textFont(mono);

  imageMode(CENTER);
}

void draw() {
  // Do some drawing!
}
