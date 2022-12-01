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

  public void _setup() {
    // Does nothing
    // Should be overiden by a super class and called in the setup method if needed
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

  abstract protected void _update();

  protected void preUpdate() {
    push();
  }

  protected void postUpdate() {
    pop();
  }
}
