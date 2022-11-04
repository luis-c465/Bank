public class TransitionOut {
  public int opacity = 255;
  public boolean done = false;

  public void update() {
    fill(0, opacity);
    rect(0, 0, width, height);

    print(opacity);
    if (opacity >= 0) {
      opacity-=8;
    } else {
      print(done);
      done = true;
    }
  }

  public void reset() {
    opacity = 255;
    done = false;
  }
}
