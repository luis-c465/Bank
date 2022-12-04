/**
 * Class whitch assetses images and audio to be played back
 * in the game
 *
 * Call the _setup method to load all the images and the sounds
 */
public class Assets {
  public PApplet p;
  // * Cards
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

  // * SHAPES
  public PShape down;
  public PShape up;

  // * BUTTONS
  public PImage enter;
  public PImage space;

  // * MISC
  public PImage intro;
  public PImage bg;

  // * SOUNDS
  public SoundFile music;

  public SoundFile correct;
  public SoundFile wrong;

  // * FONTS
  public PFont mono;
  public PFont nunito;

  public void _setup(PApplet p) {
    this.p = p;

    // Cards
    back = loadImage("card/back.jpeg");

    // * LOAD SHAPES
    down = loadShape("down.svg");
    up = loadShape("up.svg");

    // * LOAD BUTTONS
    enter = loadImage("btn/enter.png");
    space = loadImage("btn/space.png");
    space.resize(200,100);

    // * LOAD MISC
    intro = loadImage("intro.png");
    bg = loadImage("bg.jpg");

    // * LOAD SOUNDS
    // TODO: Uncomment!
    music = new SoundFile(p, "music.mp3");

    correct = new SoundFile(p, "correct.wav");
    wrong = new SoundFile(p, "wrong.wav");

    correct.amp(0.5);

    music.amp(0.2);
    music.loop();

    // * LOAD FONTS
    mono = createFont("fonts/ThaleahFat.ttf", 64);
    nunito = createFont("fonts/Nunito.ttf", 64);

    textFont(nunito);

    String[] name = new String[] { "2", "3", "4", "5", "6", "7", "8", "9", "10", "j", "q", "k", "a"};
    String[] col = new String[] { "r", "b", "g", "y"};

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

  public Object get(String k) throws IllegalAccessException, NoSuchFieldException {
        return (this.getClass().getDeclaredField(k).get(this));
    }
}
