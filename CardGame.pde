import java.util.*;
import gifAnimation.*;
import processing.sound.*;

// * CONSTANTS
final int NUM_QUESTIONS = 10;

final int BTN_SIZE = 70;
final int BTN_SPACE = 7;

// Shows the looser screen if the percent correct is less than this number
final double LOOSER_BELLOW = 0.70;

final int REPLAY_SAFE = 150;
final int REPLAY_SIZE = 500;

final int STARTBTN_SIZE = 200;
final int STARTBTN_HEIGHT = 700;


// * CLASSES
Deck deck = new Deck();

// Util
Assets assets = new Assets();
TransitionIn transitionIn;
TransitionOut transitionOut;

// * GLOABAL VARIABLES
boolean replayTrans = false;
boolean shouldDrawTest = true;

boolean intro = true;
boolean introTrans = false;

void setup() {
  size(1000, 1000);

  background(255);
  shapeMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  noStroke();

  // Default fill color is black
  fill(0);

  transitionIn = new TransitionIn();
  transitionOut = new TransitionOut();

  assets._setup(this);
  textFont(assets.nunito);

  // Debugging
  println(deck.toString());
}

void draw() {
  background(255);
}
