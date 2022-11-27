/**
 * Class whitch assetses images and audio to be played back
 * in the game
 *
 * Call the _setup method to load all the images and the sounds
 */
public class Assets {
  // * IMAGES
  public PImage impoassets;
  public PImage player;

  // * BUTTONS
  public PImage enter;

  public PImage space;

  public PImage buttons;
  public PImage skeld;

  public PImage playAgain;

  public PImage intro;

  // * SHAPES
  public PShape plus;
  public PShape minus;

  public PShape check;
  public PShape wrong;

  // * SOUNDS

  // * FONTS
  public PFont mono;
  public PFont nunito;

  public void _setup(PApplet p) {
    // * LOAD IMAGES
    impoassets = loadImage("chad.png");
    player = loadImage("susy.png");

    // * LOAD BUTTONS
    enter = loadImage("btn/enter.png");
    space = loadImage("btn/space.png");

    buttons = loadImage("buttons-sml.png");
    skeld = loadImage("skeld.png");

    playAgain = loadImage("play-again.png");

    intro = loadImage("intro.png");

    // * LOAD SHAPES
    plus = loadShape("plus.svg");
    minus = loadShape("minus.svg");

    check = loadShape("check.svg");
    wrong = loadShape("close.svg");

    // * LOAD FONTS
    mono = createFont("fonts/ThaleahFat.ttf", 64);
    nunito = createFont("fonts/Nunito.ttf", 64);

    textFont(nunito);
  }
}
