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

  // * SHAPES
  public PShape plus;
  public PShape minus;
  public PShape snowflake;
  public PShape trash;

  // * MISC
  public PImage signIn;
  public PImage intro;
  public PImage bg;

  // * ACCOUNTS
  public PImage sam;
  public PImage red;
  public PImage blue;
  public PImage green;
  public PImage yellow;
  public PImage black;
  public PImage def;

  // * FONTS
  public PFont nunito;
  public PFont nunito_small;
  public PFont nunito_large;

  public void _setup(PApplet p) {
    this.p = p;

    // * LOAD BUTTONS
    enter = loadImage("btn/enter.png");
    space = loadImage("btn/space.png");
    space.resize(200,100);

    // * LOAD SHAPES
    plus = loadShape("plus.svg");
    minus = loadShape("minus.svg");
    snowflake = loadShape("snowflake.svg");
    trash = loadShape("trash.svg");

    // * LOAD MISC
    signIn = loadImage("sign-in.png");
    intro = loadImage("intro.png");
    bg = loadImage("bg.jpg");

    // * LOAD ACCOUNTS
    sam = loadImage("accounts/sam.png");
    red = loadImage("accounts/red.png");
    blue = loadImage("accounts/blue.png");
    green = loadImage("accounts/green.png");
    yellow = loadImage("accounts/yellow.png");
    black = loadImage("accounts/black.png");
    def = loadImage("accounts/default.png");

    // * LOAD FONTS
    nunito = createFont("fonts/Nunito.ttf", 64);

    nunito_small = createFont("fonts/Nunito.ttf", 32);

    nunito_large = createFont("fonts/Nunito.ttf", 96);

    textFont(nunito);
  }

  /**
   * Saftely dynamically gets an asset with the given name
  */
  public PImage getAsset(Account acc) {
    PImage img = getAsset(acc.id.toLowerCase());
    if (img != null) {
      return img;
    } else {
      return def;
    }
  }

  /**
   * Saftely dynamically gets an asset with the given name
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
