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
// Util
Assets assets = new Assets();
Variables variables = new Variables();
TransitionIn transitionIn;
TransitionOut transitionOut;

// Game classes
Deck deck = new Deck();
Player player = new Player(assets, variables);
Enemy enemy = new Enemy(assets, variables);

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
  variables._setup();
  textFont(assets.nunito);

  // Debugging
  println(deck.toString());
  deck.deal(player, enemy);

  println(player);
  println(enemy);
}

void draw() {
  background(255);
}
