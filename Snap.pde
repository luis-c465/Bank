import java.util.*;
import java.lang.reflect.Field;
import processing.sound.*;

import controlP5.*;

// * Util classes
Assets a = new Assets();
Variables v = new Variables();

TransitionIn transitionIn = new TransitionIn(this);
TransitionOut transitionOut = new TransitionOut(this);

// * Game classes

void setup() {
  size(1000, 1000);
  procSet();

  // * Setup variables and assets
  v.setup(this);
  a.setup(this);
  // * SETUP CLASSES
}

void draw() {
  background(255);

  // Do game updates here!
}

/**
 * Sets th default settings for drawing with processing
 */
void procSet() {
  background(255);
  shapeMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  noStroke();

  // Default fill color is black
  fill(0);

}
