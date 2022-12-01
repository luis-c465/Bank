import java.util.*;
import java.lang.reflect.Field;

// * CONSTANTS
// ! Variables not initialized with a value are calculated based of processing variables
// ! and should be given a value in the calc() method

// Table
final color c_table = #3c7496;
final int table_start = 350;

// Guess card
final color c_down = #fac83c;
final int s_down = 20;
final int w_down = 150;
final int h_down = 75;
final int ts_down = 30;
final int r_down = 25;

int wc_down = (int) ((s_down + w_down) / 1.80);
int hc_down;

int wc_text_down = wc_down + 30;
int wc_icon_down = wc_down - 30;

final color c_up = #fac83c;
final int s_up = 20;
final int w_up = 150;
final int h_up = 75;
final int ts_up = 30;
final int r_up = 25;

final int sw_up = s_down + w_down + s_up;

int wc_up = (int) ((s_up + w_up) / 1.80) + sw_up - s_up;
int hc_up;

int wc_text_up = wc_up + 30;
int wc_icon_up = wc_up - 30;

// int wc_down = wc_down - 60;

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

// Cards
double ratio_card = 320.0 / 214;
final int w_card = 125;
int h_card = (int) Math.round(w_card * ratio_card);

// player
final int safe_cards_x = 200;
int pdx;
int pdy;

int pcx;

// enemy
int edx;
int edy;

int ecx;

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

// * GLOABAL VARIABLES
boolean replayTrans = false;
boolean shouldDrawTest = true;

boolean intro = true;
boolean introTrans = false;

/**
 * Updates calculated variables
 */
void calc() {
  hc_down = (int) (v.h - s_down * 2.5);
  hc_up = (int) (v.h - s_up * 2.5);

  sw_enemy = (int) v.cw - (w_enemy / 2);

  sw_glass = (int) v.cw - (w_glass / 2);

  sw_shine = v.cw + 10;

  // Cards
  pdx = v.cw + safe_cards_x;
  pdy = v.h - safe_cards_x;

  pcx = pdx;

  edx = v.cw - safe_cards_x;
  edy = table_start + safe_cards_x;

  ecx = edx;
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

  // * DEBUGGING INFO
  deck.hardDeal(player);
  println(player);
}

void draw() {
  background(255);
  drawTable();
  // drawLowBtn();
  drawHighBtn();

  drawEnemy();

  drawCards();

  player.update();
  deck.update();
  lowBtn.update();
}

void mouseMoved() {
  lowBtn.mouseMoved();
}

void drawTable() {
  shapeMode(CORNERS);

  fill(c_table);
  noStroke();
  rect(0, table_start, v.w, v.h);
}

void drawLowBtn() {
  shapeMode(CORNERS);

  fill(c_down);
  noStroke();
  rect(s_down, v.h - s_down * 5, w_down, h_down, r_down);

  // Draw text
  fill(0);
  textSize(ts_down);
  text("Low", wc_text_down, hc_down);
  shapeMode(CENTER);
  shape(a.down, wc_icon_down, hc_down, down_size, down_size);
}

void drawHighBtn() {
  shapeMode(CORNERS);

  fill(c_up);
  noStroke();
  rect(sw_up, v.h - s_up * 5, w_up, h_up, r_up);

  // Draw text
  fill(0);
  textSize(ts_up);
  text("High", wc_text_up, hc_up);
  shapeMode(CENTER);
  shape(a.up, wc_icon_up, hc_up, up_size, up_size);
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

void drawCards() {
  // Draw the cards
  // image();

  // Then move them

  // If flip then flip the cards
}

void drawDeck() {
  push();

  // Draw the players cards
  image(a.back, pdx, pdy, w_card, h_card);

  // Draw the enemys cards
  if (deck.cards.size() > 0) {
    image(a.back, edx, edy, w_card, h_card);
  }

  pop();
}
