public class Stor {
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

  public PImage upP;
  public PImage downP;
  public PImage leftP;
  public PImage rightP;

  public PImage enter;
  public PImage enterP;

  public PImage space;
  public PImage spaceP;

  public PImage winner;

  public SoundFile gunS;
  public SoundFile susDrip;

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

    upP = loadImage("btn/up-p.png");
    downP = loadImage("btn/down-p.png");
    leftP = loadImage("btn/left-p.png");
    rightP = loadImage("btn/right-p.png");

    enter = loadImage("btn/enter.png");
    enterP = loadImage("btn/enter-p.png");

    space = loadImage("btn/space.png");
    spaceP = loadImage("btn/space-p.png");

    winner = loadImage("winner.jpeg");

    /**
     * LOAD SOUNDS
     */
    gunS = new SoundFile(p, "gun.mp3");
    susDrip = new SoundFile(p, "sus-drip.mp3");
  }
}
