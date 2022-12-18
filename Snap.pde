import java.util.*;
import java.lang.reflect.Field;
import processing.sound.*;

import controlP5.*;

// * CONSTANTS
public static final int h = 1000;
public static final int w = 1000;

public static final int ch = 500;
public static final int cw = 500;

// * VARIABLES
public boolean transitioning = false;

// * COLORS
public static final color bg = #1e293b;

// * Util classes
public Assets a = new Assets();

// * Librarry classes
public ControlP5 cp5;

// * Transition classes
public TransitionIn transIn = new TransitionIn(this);
public TransitionOut transOut = new TransitionOut(this);

// * Game classes
public StartUp startUp = new StartUp(this);

public Dealer dealer = new Dealer();
public Player p1 = new Player(this);
public Player p2 = new Player(this);

void setup() {
  size(1000, 1000);
  procSet();

  // * Setup variables and assets
  a.setup(this);
  cp5 = new ControlP5(this);

  // * SETUP CLASSES
  dealCards();
  p1.setup();
  p2.setup();
  startUp.setup();
}

void draw() {
  background(bg);

  // Do game updates here!
  startUp.update();
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

void dealCards() {
  dealer.deal(p1,5);
  dealer.deal(p1.deck,7);

  dealer.deal(p2,5);
  dealer.deal(p2.deck,7);

  // Print out the cards of the player for debuggging
  println("Player 1: \n" + p1 + "\n\n");
  println("Player 2: \n" + p2 + "\n\n");
}
