import java.util.*;
import java.lang.reflect.Field;

// * CONSTANTS
final color c_table = #3c7496;
final int table_start = 350;

final int down_size = 100;
final int up_size = 100;

// * Util classes
Assets a = new Assets();
Variables v = new Variables();
TransitionIn transitionIn;
TransitionOut transitionOut;

// * Game classes
Deck deck = new Deck(a, v);
Player player = new Player(a, v);
Enemy enemy = new Enemy(a, v);

LowBtn lowBtn = new LowBtn(a, v);
HighBtn highBtn = new HighBtn(a, v);

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

  transitionIn = new TransitionIn();
  transitionOut = new TransitionOut();

  // * SETUP CLASSES
  player.setup();
  deck.setup();
  enemy.setup();

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

  player.update();
  deck.update();
  enemy.update();

  lowBtn.update();
  highBtn.update();
}

void mousePressed() {
  lowBtn.mousePressed();
  highBtn.mousePressed();
}

void checkBtns() {
  if (!v.hasVoted && lowBtn.clicked || highBtn.clicked) {
    if (lowBtn.clicked) {
      v.vote = false;
      v.hasVoted = true;
    } else if (highBtn.clicked) {
      v.vote = true;
      v.hasVoted = true;
    }

    if (v.hasVoted) {
      check();
    }
  }
}

void drawTable() {
  shapeMode(CORNERS);

  fill(c_table);
  noStroke();
  rect(0, table_start, v.w, v.h);
}

/**
 * Checks the cards of the player and enemy
 */
void check() {
  int order = player.hand.compareTo(deck.hand);
  if (order < -1) { // Player wins
    v.check = Round.WIN;
  } else if (order > 1) { // Enemy wins
    v.check = Round.LOSS;
  } else { // Tie
    v.check = Round.TIE;
  }
}
