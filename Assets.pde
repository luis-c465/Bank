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

  // * MISCELANEOUS
  public PImage bg;
  public PImage intro;

  // * FONTS
  public PFont nunito;

  public void setup(Snap app) {
    this.p = app;

    // * LOAD BUTTONS
    enter = loadImage("btn/enter.png");
    space = loadImage("btn/space.png");
    space.resize(200,100);

    // * LOAD MISC
    bg = loadImage("bg.jpg");
    intro = loadImage("bg.jpg");

    // * LOAD FONTS
    nunito = createFont("fonts/Nunito.ttf", 64);

    textFont(nunito);
  }

  /**
   * Saftely and dynamically get an asset with the given name
   */
  public PImage getAsset(String name) {
    try {
      return (PImage) get(name);
    } catch(Exception e) {
      return null;
    }
  }

  public Object get(String k) throws IllegalAccessException, NoSuchFieldException {
    return (this.getClass().getDeclaredField(k).get(this));
  }
}
