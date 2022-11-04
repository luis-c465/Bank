public class TransitionIn {
  public int opacity = 0;
  public boolean done = false;

  public void update() {
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
}
