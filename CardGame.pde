import java.util.*;
import java.lang.reflect.Field;

// * Util classes
Assets a = new Assets();
Variables v = new Variables();
TransitionIn transitionIn;
TransitionOut transitionOut;

// * Game classes
Deck deck = new Deck(a, v);
Player player = new Player(a, v);
Enemy enemy = new Enemy(a, v);

Table table = new Table(a, v);
ScoreBar scoreBar = new ScoreBar(a, v);

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
}

void draw() {
  background(255);
  checkBtns();

  table.update();
  scoreBar.update();

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
  if (!v.hasVoted && (lowBtn.clicked || highBtn.clicked)) {
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

/**
 * Checks the cards of the player and enemy
 */
void check() {
  int order = player.hand.compareTo(deck.hand);

  if (order == 0) {
    v.check = Round.TIE;
    return;
  }

  if ((v.vote && order == -1) || (!v.vote && order == 1)) { // Player wins
    v.check = Round.WIN;
    v.totalCorrect++;
    v.currStreak++;

    // Increase the score
    v.score += Math.pow((v.currStreak + 1), 2) * 100;
  } else { // Enemy wins
    v.check = Round.LOSS;
    v.currStreak = 0;
  }
}

public void push() {
  pushMatrix();
  pushStyle();
}

public void pop() {
  popMatrix();
  popStyle();
}
