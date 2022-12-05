import java.util.*;
import java.lang.reflect.Field;
import processing.sound.*;

// * Util classes
Assets a = new Assets();
Variables v = new Variables();
TransitionIn transitionIn = new TransitionIn(a, v);
TransitionOut transitionOut = new TransitionOut(a, v);

// * Game classes
Table table = new Table(a, v);
Intro intro = new Intro(a, v);

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
}

void draw() {
  background(255);

  if (intro.show) {
    intro.update();
    return;
  }

  checkBtns();

  table.update();

  // Update the other stuff here

  if (intro.trans) {
    intro.update();
  }
}

void mousePressed() {
}

void keyPressed() {
  intro.keyPressed();
}

void checkBtns() {
  // if (!v.hasVoted && intro.done && (lowBtn.clicked || highBtn.clicked)) {
  //   if (lowBtn.clicked) {
  //     v.vote = false;
  //     v.hasVoted = true;
  //   } else if (highBtn.clicked) {
  //     v.vote = true;
  //     v.hasVoted = true;
  //   }

  //   if (v.hasVoted) {
  //     check();
  //   }
  // }
}
