public class TransitionOut extends Obj {
  public int opacity = 255;
  public boolean done = false;

  public void _update() {
    pushMatrix();

    fill(0, opacity);
    rect(0, 0, width, height);

    popMatrix();

    if (opacity >= 0) {
      opacity-=4;
    } else {
      done = true;
    }
  }

  public void reset() {
    opacity = 255;
    done = false;
  }

  public TransitionOut(Assets a, Variables v) { super(a, v); v.transOut = this; }
}
