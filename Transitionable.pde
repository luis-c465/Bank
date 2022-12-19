/**
 * Class for objects whitch transition between frames in the app
*/
public abstract class Transitionable extends Obj {
  // Set to true to begin transitioning!
  public boolean trans = false;
  // Done transitioning
  public boolean middle = false;
  public boolean done = false;

  protected void preUpdate() {
    super.preUpdate();

    if (middle && trans) {
      transition();
    }
  }

  protected void postUpdate() {
    super.postUpdate();

    if (!middle && trans) {
      transition();
    }
  }

  private void transition() {
    if (!m.transIn.done) {
        m.transIn.update();

        if (m.transIn.beforeDone) {
          middle = true;
          shouldUpdate = false;
          onTransOutBegin();
        }
      }
    else {
      if (!m.transOut.done) {
        m.transOut.update();
      }
    }

    if (m.transIn.done && m.transOut.done) {
      // When the trans is done
      trans = false;
      done = true;
      middle = false;

      m.transIn.reset();
      m.transOut.reset();
    }
  }

  // Method whitch inheriting classes should implement
  // for cleanup
  abstract protected void onTransOutBegin();

  public Transitionable(Snap app) { super(app); }
}
