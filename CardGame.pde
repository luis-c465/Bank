import java.util.*;
import java.lang.reflect.Field;

// * CONSTANTS
// ! Variables not initialized with a value are calculated based of processing variables
// ! and should be given a value in the calc() method

// Table
final color c_table = #3c7496;
final int table_start = 350;

final int down_size = 100;
final int up_size = 100;

// Enemy
// * TO BE CENTERED
final int str_enemy = 15;
final color c_enemy = #c51110;
final int w_enemy = 450;
int sw_enemy;
final int sh_enemy = 50;
int h_enemy = table_start - sh_enemy;
int r_enemy = w_enemy / 2;

final color c_glass = #95cadd;
int sw_glass;
int sh_glass = sh_enemy + 60;
int h_glass = 75;
int w_glass = 200;
int r_glass = 100;

final color c_shine = #fcfff8;
int sw_shine;
int sh_shine = sh_glass + str_enemy / 2;
int w_shine = 75;
int h_shine = 25;
int r_shine = r_glass;

boolean cardMove = false;
boolean cardFlip = false;
int e_flip_cycles = 20;
int flip_cycles;

// * CLASSES
// Util
Assets a = new Assets();
Variables v = new Variables();
TransitionIn transitionIn;
TransitionOut transitionOut;

// * Game classes
Deck deck = new Deck(a, v);
Player player = new Player(a, v);
LowBtn lowBtn = new LowBtn(a, v);
HighBtn highBtn = new HighBtn(a, v);

// * GLOABAL VARIABLES
boolean replayTrans = false;
boolean shouldDrawTest = true;

boolean intro = true;
boolean introTrans = false;

/**
 * Updates calculated variables
 */
void calc() {
  sw_enemy = (int) v.cw - (w_enemy / 2);

  sw_glass = (int) v.cw - (w_glass / 2);

  sw_shine = v.cw + 10;
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

  // * SETUP CLASSES
  player.setup();
  deck.setup();
  lowBtn.setup();
  highBtn.setup();

  // * DEBUGGING INFO
  deck.hardDeal(player);
  println(player);
}

void draw() {
  background(255);
  checkBtns();

  drawTable();
  drawEnemy();

  player.update();
  deck.update();
  lowBtn.update();
  highBtn.update();
}

void mousePressed() {
  lowBtn.mousePressed();
  highBtn.mousePressed();
}

void checkBtns() {
  if (lowBtn.clicked) {
    println("low btn clicked");
  }
}

void drawTable() {
  shapeMode(CORNERS);

  fill(c_table);
  noStroke();
  rect(0, table_start, v.w, v.h);
}

void drawEnemy() {
  shapeMode(CORNERS);

  stroke(0);
  strokeWeight(str_enemy);
  fill(c_enemy);
  rect(sw_enemy, sh_enemy, w_enemy, h_enemy, r_enemy, r_enemy, 0, 0);

  // Draw glass
  fill(c_glass);
  rect(sw_glass, sh_glass, w_glass, h_glass, r_glass);

  // Draw shine
  noStroke();
  fill(c_shine);
  rect(sw_shine, sh_shine, w_shine, h_shine, r_shine);
}

/**
 * Checks the cards of the player and enemy
 * Returns -1 if the players has a higher card number
 *
 * For the player that has won they are given both of the cards
 */
int check() {
  int order = player.hand.compareTo(deck.hand);
  if (order < -1) { // Player wins
    println("Player wins");
  } else if (order > 1) { // Enemy wins
    // guh
  } else { // Tie
    // guh
  }

  return order;
}
