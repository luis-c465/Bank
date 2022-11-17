import processing.video.*;
import processing.sound.*;

// * CONSTANTS
final int NUM_QUESTIONS = 1;
// final int NUM_QUESTIONS = 10;

// ! This size is set to avoid issues where the program wont fit on the screen of school computers
final int WINDOW_SIZE = 1_000;

final int BTN_SIZE = 70;
final int BTN_SPACE = 7;


// * CLASSES

Stor stor = new Stor();

Test t = new Test(NUM_QUESTIONS, stor);

TransitionIn transitionIn;
TransitionOut transitionOut;

//  * GLOBAL VARIABLES
int curMazeNum = 0;
boolean didDeath = false;
boolean levelTransition = false;
boolean intro = true;
boolean introTransition = false;
boolean winner = false;

void settings() {
  size(WINDOW_SIZE, WINDOW_SIZE);
}

void setup() {
  background(255);
  shapeMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  noStroke();

  // Default fill color is black
  fill(0);

  transitionIn = new TransitionIn();
  transitionOut = new TransitionOut();

  stor._setup(this);

  // TODO: Replace this with a solid sans font from google fonts
  textFont(stor.nunito);

  t._setup();
}

void draw() {
  background(255);

  push();

  imageMode(CORNERS);
  image(stor.skeld, 0, 0, width, height);

  pop();

  t._draw();

  if (t.done) {
    drawEnd();
  }
}

void mousePressed() {
  // Prevent the user from changing their answer when they have already checked it
  if (t.qCheck) return;

  String btn = getBtn();

  switch(btn) {
    case "x":
      t.input = "";
      return;
    case "check":
      t.check();
      return;
    case "Null":
      return;
  }

  if (t.input.length() < 12) {
    t.input += btn;
  }
}

void keyPressed() {
  if (Character.isDigit(key) && t.input.length() < 12) {
    t.input += key;
  }

  if (keyCode == BACKSPACE && t.input.length() > 0) {
    t.input = t.input.substring(0, t.input.length() - 1);
  } else if (keyCode == ENTER || keyCode == RETURN) {
    t.check();
  }
}

// ! BLACK MAGIC DO NOT TOUCH LOL
// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}


/**
 * Should only be called when the mouse has been pressed
 */
String getBtn() {
  int cw = width / 2;
  int ch = height / 2;
  // Half of the btn size
  int bh = BTN_SIZE / 2;

  // The height of the current row
  int h = ch + bh;

  boolean bc = mouseX > cw - bh && mouseX < cw + bh;
  boolean bl = mouseX > cw - bh * 3 - BTN_SPACE && mouseX < cw - bh - BTN_SPACE;
  boolean br = mouseX > cw + bh + BTN_SPACE && mouseX < cw + bh * 3 + BTN_SPACE;

  if (!bl && !bc && !br) {
    return "Null";
  }

  // If clicked in the first row
  if (mouseY > h - bh && mouseY < h + bh) {
    if (bl) {
      return "1";
    } else if (bc) {
      return "2";
    } else if (br) {
      return "3";
    }
  }

  // If clicked in the second row
  h += bh * 2 + BTN_SPACE;
  if (mouseY > h - bh && mouseY < h + bh) {
    if (bl) {
      return "4";
    } else if (bc) {
      return "5";
    } else if (br) {
      return "6";
    }
  }

  // If clicked in the 3rd row
  h += bh * 2 + BTN_SPACE;
  if (mouseY > h - bh && mouseY < h + bh) {
    if (bl) {
      return "7";
    } else if (bc) {
      return "8";
    } else if (br) {
      return "9";
    }
  }

  // If clicked in the last row
  h += bh * 2 + BTN_SPACE;
  if (mouseY > h - bh && mouseY < h + bh) {
    if (bl) {
      return "x";
    } else if (bc) {
      return "0";
    } else if (br) {
      return "check";
    }
  }

  return "Null";
}

/**
 * Draws the end of the game
 * if the user has won the game (completed with a certain percent of accuracy)
 * they are shown the winner screen
 * else they are shown the looser screen
 */
void drawEnd() {
  // First show the transition
  if (!transitionIn.done) {
    transitionIn.update();
    if (transitionIn.opacity > 255) {
      stor.Mwinner.play();
    }
  } else {
    // TODO: Should check if the user has actually won but for now just displays a winner :)
    drawWinner();
  }
}

void drawWinner() {
  push();

  imageMode(CENTER);
  image(stor.Mwinner, width / 2, height / 2, width * 1.4, height);

  image(stor.player, width / 2, height / 2 + 50);
  textSize(24);

  fill(255);
  text("!rico", width / 2, height / 2 + 200);

  pop();
}
