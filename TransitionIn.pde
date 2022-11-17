/**
 * Transitions in between 2 screens
 *
 * The update method should be called durring each draw for this to work
 */
public class TransitionIn {
  public int opacity = 0;
  public boolean done = false;

  public void update() {
    push();

    fill(0, opacity);
    rect(0, 0, width, height);

    pop();

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
}
