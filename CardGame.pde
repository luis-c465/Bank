import java.util.*;

// * CONSTANTS
// Table
final color c_table = #3c7496;
final int table_start = 350;

// Flip card
final color c_flip = #fac83c;
final int s_flip = 20;
final int w_flip = 200;
final int h_flip = 75;
final int ts_flip = 30;
final int r_flip = 25;

int wc_flip = (int) ((s_flip + w_flip) / 1.80);
int hc_flip;

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

/**
 * Updates calculated variables
 */
void calc() {
  hc_flip = (int) (v.h - s_flip * 2.5);
}

void setup() {
  size(1000, 1000);

  background(255);
  shapeMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  noStroke();

  // Default fill color is black
  fill(0);

  a._setup(this);
  v._setup();
  calc();

  transitionIn = new TransitionIn();
  transitionOut = new TransitionOut();

  // * DEBUGGING INFO
  println(player);
  println(enemy);
}

void draw() {
  background(255);
  drawTable();
  drawFlipCard();
}

void drawTable() {
  shapeMode(CORNERS);

  fill(c_table);
  noStroke();
  rect(0, table_start, v.w, v.h);
}

void drawFlipCard() {
  shapeMode(CORNERS);

  fill(c_flip);
  noStroke();
  rect(s_flip, v.h - s_flip * 5, w_flip, h_flip, r_flip);

  // Draw text
  fill(0);
  textSize(ts_flip);
  text("Flip Cards", wc_flip, hc_flip);
}
