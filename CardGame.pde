import java.util.*;
import java.lang.reflect.Field;
import processing.sound.*;

// * Util classes
Assets a = new Assets();
Variables v = new Variables();
TransitionIn transitionIn = new TransitionIn(a, v);
TransitionOut transitionOut = new TransitionOut(a, v);

// * Game classes
Deck deck = new Deck(a, v);
Player player = new Player(a, v);
Enemy enemy = new Enemy(a, v);

Table table = new Table(a, v);
ScoreBar scoreBar = new ScoreBar(a, v);
GameTrans gameTrans = new GameTrans(a, v);
Intro intro = new Intro(a, v);

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

  if (intro.show) {
    intro.update();
    return;
  }

  checkBtns();

  table.update();
  scoreBar.update();

  player.update();
  deck.update();
  enemy.update();

  lowBtn.update();
  highBtn.update();

  gameTrans.update();

  if (intro.trans) {
    intro.update();
  }
}

void mousePressed() {
  lowBtn.mousePressed();
  highBtn.mousePressed();
}

void keyPressed() {
  gameTrans.keyPressed();
  intro.keyPressed();
}

void checkBtns() {
  if (!v.hasVoted && intro.done && (lowBtn.clicked || highBtn.clicked)) {
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
  v.roundNum++;
  int order = player.hand.compareTo(deck.hand);

  if (order == 0) {
    v.check = Round.TIE;
    return;
  }

  if ((v.vote && order == -1) || (!v.vote && order == 1)) { // Player wins
    v.check = Round.WIN;
    v.totalCorrect++;
    v.currStreak++;
    a.correct.jump(0);

    // Update the highest streak
    if (v.currStreak > v.highestStreak) {
      v.highestStreak = v.currStreak;
    }

    // Increase the score
    v.score += Math.pow((v.currStreak + 1), 2) * 100;
  } else { // Enemy wins
    v.check = Round.LOSS;
    v.currStreak = 0;
    a.wrong.jump(0);
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
