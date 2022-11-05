public class ImageStor {
  public PImage sus;
  public PImage player;
  public PImage gun;
  public PImage gunSmall;

  public PImage playerDead;
  public PImage susDead;

  public void setup() {
    sus = loadImage("sus.png");
    player = loadImage("player.png");
    gun = loadImage("gun.png");
    gunSmall = loadImage("gun-small.png");

    playerDead = loadImage("player-dead.png");
    susDead = loadImage("sus-dead.png");
  }
}
