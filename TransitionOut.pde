public class TransitionOut {
  public int opacity = 255;
  public boolean done = false;

  public void update() {
    push();

    fill(0, opacity);
    rect(0, 0, width, height);

    pop();

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
