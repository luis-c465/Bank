/**
 * Class whitch stores images and audio to be played back
 * in the game
 *
 * Call the _setup method to load all the images and the sounds
 */
public class Stor {
  // * IMAGES
  public PImage impostor;
  public PImage player;

  // * BUTTONS
  public PImage enter;

  public PImage space;

  public PImage buttons;
  public PImage skeld;

  public PImage playAgain;

  // * SHAPES
  public PShape plus;
  public PShape minus;

  public PShape check;
  public PShape wrong;

  // * SOUNDS

  // * FONTS
  public PFont mono;
  public PFont nunito;

  // * MOVIES
  public Movie Mwinner;
  public Movie Mdefeat;

  public void _setup(PApplet p) {
    // * LOAD IMAGES
    impostor = loadImage("chad.png");
    player = loadImage("susy.png");

    // * LOAD BUTTONS
    enter = loadImage("btn/enter.png");
    space = loadImage("btn/space.png");

    buttons = loadImage("buttons-sml.png");
    skeld = loadImage("skeld.png");

    playAgain = loadImage("play-again.png");

    // * LOAD SHAPES
    plus = loadShape("plus.svg");
    minus = loadShape("minus.svg");

    check = loadShape("check.svg");
    wrong = loadShape("close.svg");

    // * LOAD SOUNDS

    // * LOAD FONTS
    mono = createFont("fonts/ThaleahFat.ttf", 64);
    nunito = createFont("fonts/Nunito.ttf", 64);

    // * LOAD MOVIES
    Mwinner = new Movie(p, "victory.mp4");
    Mdefeat = new Movie(p, "defeat.mp4");
  }
}
