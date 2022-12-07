/**
 * Class whitch assetses images and audio to be played back
 * in the game
 *
 * Call the _setup method to load all the images and the sounds
 */
public class Assets {
  public PApplet p;

  // * BUTTONS
  public PImage enter;
  public PImage space;

  // * MISC
  public PImage signIn;
  public PImage intro;
  public PImage bg;

  // * FONTS
  public PFont nunito;
  public PFont nunito_small;

  public void _setup(PApplet p) {
    this.p = p;

    // * LOAD BUTTONS
    enter = loadImage("btn/enter.png");
    space = loadImage("btn/space.png");
    space.resize(200,100);

    // * LOAD MISC
    signIn = loadImage("sign-in.png");
    intro = loadImage("intro.png");
    bg = loadImage("bg.jpg");

    // * LOAD SOUNDS

    // * LOAD FONTS
    nunito = createFont("fonts/Nunito.ttf", 64);

    nunito_small = createFont("fonts/Nunito.ttf", 32);

    textFont(nunito);
  }
}
