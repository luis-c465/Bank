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
  public PShape play;

  // * MISCELANEOUS
  public PImage bg;
  public PImage intro;

  // * FONTS
  public PFont nunito;

  // !Smaller versions of fonts are loaded because controlP5 does not give a method to set the font size of the input text
  public PFont nunito_small;


  // * Cards
  /* #region Cards */
  public String[] name = new String[] { "2", "3", "4", "5", "6", "7", "8", "9", "10", "j", "q", "k", "a"};
  public String[] col = new String[] { "r", "b", "g", "y"};

  public PImage back;

  public PImage r2;
  public PImage r3;
  public PImage r4;
  public PImage r5;
  public PImage r6;
  public PImage r7;
  public PImage r8;
  public PImage r9;
  public PImage r10;
  public PImage rj;
  public PImage rq;
  public PImage rk;
  public PImage ra;

  public PImage b1;
  public PImage b2;
  public PImage b3;
  public PImage b4;
  public PImage b5;
  public PImage b6;
  public PImage b7;
  public PImage b8;
  public PImage b9;
  public PImage b10;
  public PImage bj;
  public PImage bq;
  public PImage bk;
  public PImage ba;

  public PImage g1;
  public PImage g2;
  public PImage g3;
  public PImage g4;
  public PImage g5;
  public PImage g6;
  public PImage g7;
  public PImage g8;
  public PImage g9;
  public PImage g10;
  public PImage gj;
  public PImage gq;
  public PImage gk;
  public PImage ga;

  public PImage y1;
  public PImage y2;
  public PImage y3;
  public PImage y4;
  public PImage y5;
  public PImage y6;
  public PImage y7;
  public PImage y8;
  public PImage y9;
  public PImage y10;
  public PImage yj;
  public PImage yq;
  public PImage yk;
  public PImage ya;
  /* #endregion */

  public void setup(Snap app) {
    this.p = app;

    // * LOAD BUTTONS
    enter = loadImage("btn/enter.png");
    space = loadImage("btn/space.png");
    space.resize(200,100);

    // * LOAD SHAPES
    play = loadShape("play.svg");

    // * LOAD MISC
    bg = loadImage("bg.jpg");
    intro = loadImage("bg.jpg");

    // * LOAD FONTS
    nunito = createFont("fonts/Nunito.ttf", 64);
    nunito_small = createFont("fonts/Nunito.ttf", 32);

    textFont(nunito);

    back = loadImage("card/back.jpeg");
    for (String n : name) {
      for (String c : col) {
        try {
          String tmp = c + n;
          Field f = this.getClass().getDeclaredField(tmp);
          PImage img = loadImage("card/" + tmp + ".jpeg");
          f.set(this, img);
        } catch (Exception e) {
          // Do nothing lol
        }
      }
    }
  }

  public PImage getCard(Card c) {
    try {
      return (PImage) get(c.col + c.c);
    } catch(Exception e) {
      return null;
    }
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
