public class TransitionOut {
  public int opacity = 255;
  public boolean done = false;

  public void update() {
    fill(0, opacity);
    rect(0, 0, width, height);

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
}
