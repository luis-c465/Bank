import java.util.*;
import java.lang.reflect.Field;
import processing.sound.*;

import controlP5.*;

String username;
String password;

// * Util classes
Assets a = new Assets();
Variables v = new Variables();

TransitionIn transitionIn = new TransitionIn(this);
TransitionOut transitionOut = new TransitionOut(this);

// * Game classes
SignIn signIn = new SignIn(this);
Sidebar sidebar = new Sidebar(this);
AccountViewer accViewer = new AccountViewer(this);

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
  v.accViewer = accViewer;

  // Setup inputs
  v.cp5 = new ControlP5(this);
  signIn.setup();
  sidebar.setup();
  accViewer.setup();

  setupAccounts();

  // * SETUP CLASSES
}

void draw() {
  background(255);

  if (!signIn.trans) {
    signIn.update();
  }

  // Update the other stuff here
  if (v.signedIn) {
    sidebar.update();
    accViewer.update();
  }

  if (signIn.trans) {
    signIn.update();
  }
}

void mousePressed() {
  signIn.mousePressed();
  sidebar.mousePressed();
  accViewer.mousePressed();
}

// Should be called onlly when the number of accounts is equal to 0
// Or at the start of the program
void setupAccounts() {
  Account sam = new Account("FTX", -99999, "Sam", true);
  Account r = new Account("Red sus", 500, "Red");
  Account b = new Account("Blue sus", 5, "Blue");
  Account g = new Account("Green sus", 5000, "Green");
  Account y = new Account("Yellow sus", 500, "Yellow");
  Account black = new Account("Black sus", 8000, "Black");

  v.accounts.add(sam);
  v.accounts.add(r);
  v.accounts.add(b);
  v.accounts.add(g);
  v.accounts.add(y);
  v.accounts.add(black);
}
