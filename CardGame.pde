import java.util.*;

// * CONSTANTS
final color table = #3c7496;
final int table_start = 350;

// * CLASSES
// Util
Assets a = new Assets();
Variables v = new Variables();
TransitionIn transitionIn;
TransitionOut transitionOut;

// Game classes
Deck deck = new Deck();
Player player = new Player(a, v);
Enemy enemy = new Enemy(a, v);

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
  v._setup();

  println(player);
  println(enemy);
}

void draw() {
  background(255);
  drawTable();
}

void drawTable() {
  shapeMode(CORNERS);
  fill(table);
  noStroke();
  rect(0, table_start, v.w, v.h);
}
