import java.util.*;

// * CONSTANTS
// ! Variables not initialized with a value are calculated based of processing variables
// ! and should be given a value in the calc() method

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
int pcx;
int pcy;

// enemy
int ecx;
int ecy;


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

  sw_enemy = (int) v.cw - (w_enemy / 2);

  sw_glass = (int) v.cw - (w_glass / 2);

  sw_shine = v.cw + 10;

  // Cards
  pcx = v.cw + safe_cards_x;
  pcy = v.h - safe_cards_x;

  ecx = v.cw - safe_cards_x;
  ecy = table_start + safe_cards_x;
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
  deck.deal(player, enemy);
  println(player);
  println("\n ---- \n ");
  println(enemy);
}

void draw() {
  background(255);
  drawTable();
  drawFlipCard();

  drawEnemy();

  drawCards();
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
  int order = player.cur.compareTo(enemy.cur);
  if (order < -1) { // Player wins
    println("Player wins");
  } else if (order > 1) { // Enemy wins
  } else { // Tie
  }

  return order;
}

void drawCards() {
  push();

  // Draw the players cards
  if (player.cards.size() > 0) {
    image(a.back, pcx, pcy, w_card, h_card);
  }

  // Draw the enemys cards
  if (enemy.cards.size() > 0) {
    image(a.back, ecx, ecy, w_card, h_card);
  }

  pop();
}
