import gifAnimation.*;
import processing.sound.*;

// * CONSTANTS
final int NUM_QUESTIONS = 10;

// ! This size is set to avoid issues where the program wont fit on the screen of school computers
final int WINDOW_SIZE = 1_000;

final int BTN_SIZE = 70;
final int BTN_SPACE = 7;


// * CLASSES

Stor stor = new Stor();
Gif dripGif;

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
boolean check = false;

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
  t._draw();

  // push();
  // shapeMode(CENTER);

  // fill(0);
  // square(width / 2 - 125, height / 2, BTN_SIZE);

  // fill(255);
  // square(width / 2 + 50, height / 2, BTN_SIZE);
  // pop();
}

void mousePressed() {
  String btn = getBtn();
  println(btn);

  switch(btn) {
    case "x":
      t.input = "";
      return;
    case "check":
      check = true;
      return;
    case "Null":
      return;
  }

  if (t.input.length() < 12) {
    t.input += btn;
  }
  println(t.input);
}

// TODO: Add support for keyboard input!
// void keyPressed() {
//   switch (key) {
//     case '1':

//   }
// }

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
