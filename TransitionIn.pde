/**
 * Transitions in between 2 screens
 *
 * The update method should be called durring each draw for this to work
 */
public class TransitionIn extends Obj {
  public int opacity = 0;
  public boolean done = false;

  public void _update() {
    fill(0, opacity);
    rect(0, 0, width, height);

    if (opacity <= 255) {
      opacity+=8;
    } else {
      done = true;
    }
  }

  public void reset() {
    opacity = 0;
    done = false;
  }

  public TransitionIn(Assets a, Variables v) { super(a, v); v.transIn = this; }
}
