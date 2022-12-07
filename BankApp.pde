import java.util.*;
import java.lang.reflect.Field;
import processing.sound.*;

import com.thoughtworks.xstream.*;
import com.thoughtworks.xstream.security.*;
import controlP5.*;

String username;
String password;

// * DB
XStream x = new XStream(new StaxDriver());
PersistenceStrategy strategy;
XmlArrayList l;

// * Util classes
Assets a = new Assets();
Variables v = new Variables();
TransitionIn transitionIn = new TransitionIn(a, v);
TransitionOut transitionOut = new TransitionOut(a, v);

// * Game classes
// Table table = new Table(a, v);
Intro intro = new Intro(a, v);
SignIn signIn = new SignIn(a, v);

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

  // * SETUP DB
  x.addPermission(AnyTypePermission.ANY);
  strategy = new FilePersistenceStrategy(new File("/tmp"), x);

  l = new XmlArrayList(strategy);
  x.alias("account", Account.class);

  x.registerConverter(new AccountConverter());
  println("Amount of accounts" + l.size());
  if (l.size() == 0) {
    setupAccounts();
  }

  // Setup inputs
  v.cp5 = new ControlP5(this);
  signIn.setup();


  // * SETUP CLASSES
}

void draw() {
  background(255);

  signIn.update();

  if (intro.show) {
    intro.update();
    return;
  }

  checkBtns();

  // table.update();

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

// Should be called onlly when the number of accounts is equal to 0
void setupAccounts() {
  Account sam = new Account("FTX", -99999, "Sam", true);
  Account r = new Account("r", 500, "Red");
  Account b = new Account("b", 5, "Blue");
  Account g = new Account("g", 5000, "Green");
  Account y = new Account("y", 500, "Yellow");
  Account black = new Account("b", 8000, "Black");

  l.add(sam);
  l.add(r);
  l.add(b);
  l.add(g);
  l.add(y);
  l.add(black);
}
