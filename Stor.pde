/**
 * Class whitch stores images and audio to be played back
 * in the game
 *
 * Call the _setup method to load all the images and the sounds
 */
public class Stor {
  // * IMAGES
  public PImage sus;
  public PImage player;
  public PImage gun;
  public PImage gunSmall;

  public PImage playerDead;
  public PImage susDead;

  // Buttons
  public PImage up;
  public PImage down;
  public PImage left;
  public PImage right;

  // public PImage upP;
  // public PImage downP;
  // public PImage leftP;
  // public PImage rightP;

  public PImage enter;
  // public PImage enterP;

  public PImage space;
  // public PImage spaceP;

  public PImage winner;

  // * SHAPES
  public PShape plus;
  public PShape minus;

  // * SOUNDS
  public SoundFile gunS;
  public SoundFile susDrip;

  // * FONTS
  public PFont mono;
  public PFont nunito;

  public void _setup(PApplet p) {
    sus = loadImage("sus.png");
    player = loadImage("player.png");
    gun = loadImage("gun.png");
    gunSmall = loadImage("gun-small.png");

    playerDead = loadImage("player-dead.png");
    susDead = loadImage("sus-dead.png");

    up = loadImage("btn/up.png");
    down = loadImage("btn/down.png");
    left = loadImage("btn/left.png");
    right = loadImage("btn/right.png");

    // upP = loadImage("btn/up-p.png");
    // downP = loadImage("btn/down-p.png");
    // leftP = loadImage("btn/left-p.png");
    // rightP = loadImage("btn/right-p.png");

    enter = loadImage("btn/enter.png");
    // enterP = loadImage("btn/enter-p.png");

    space = loadImage("btn/space.png");
    // spaceP = loadImage("btn/space-p.png");

    winner = loadImage("winner.jpeg");

    plus = loadShape("plus.svg");
    minus = loadShape("minus.svg");

    // * LOAD SOUNDS
    gunS = new SoundFile(p, "gun.mp3");
    susDrip = new SoundFile(p, "sus-drip.mp3");

    // * LOAD FONTS
    mono = createFont("fonts/ThaleahFat.ttf", 64);
    nunito = createFont("fonts/Nunito.ttf", 64);
  }
}
