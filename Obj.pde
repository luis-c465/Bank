/**
 * Abstract class for objects that will be drawn to the screen
 */
public abstract class Obj {
  protected Assets a;
  protected Variables v;
  protected Snap app;

  public Obj(Snap app) {
    this.a = app.a;
    this.v = app.v;
    this.app = app;
  }

  public void setup() {
    // Do sone setup
    preSetup();

    _setup();

    postSetup();
  }


  protected void preSetup() {
    // Should be used for super classes to setup variables
  }

  protected void postSetup() {
    // Should be used for super classes to ovveride variables
  }

  protected void _setup() {
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
