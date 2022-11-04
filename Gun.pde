public class Gun {
  public int x;
  public int y;
  public Maze m;

  public boolean broken = false;
  // Change in percent for the sword to break when used!
  private double chance = 0.50;
  private boolean pickedUp = false;

  public Gun(int x, int y, Maze m) {
    this.x = x;
    this.y = y;
    this.m = m;
  }

  public boolean use() {
    if (broken) return false;

    broken = willBreak();
    return true;
  }

  public boolean willBreak() {
    double r = Math.random();
    return (r >= chance);
  }

  public void update() {
    if (pickedUp) return;


    image(
      m.stor.gun,
      (x * Settings.STEP) + Settings.STEP / 2,
      (y * Settings.STEP) + Settings.STEP / 2
    );
  }
}
