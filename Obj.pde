/**
 * Abstract class for objects that will be drawn to the screen
 */
public abstract class Obj {
  private Assets a;
  private Variables v;

  public Obj(Assets a, Variables v) {
    this.a = a;
    this.v = v;
  }

  /**
   * Draws and updates the object
   * Should not be overeiden by a super class
   */
  public void update() {
    preUpdate();

    _update();

    postUpdate();
  }

  abstract void _update();

  protected void preUpdate() {
    pushMatrix();
  }

  protected void postUpdate() {
    popMatrix();
  }
}
