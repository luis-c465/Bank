/**
 * Abstract class for transitions that will take up the entire screen
 * i.e. fade to black, fade out from black
*/
public abstract class Transition extends Obj {
  public int starting_opacity = 0;
  protected int opacity = 0;
  public int end_opacity = 255;
  // Defines if the tick method increases or decreases the opacity of the transiton
  public boolean up;
  public int step = 4;

  // !Bellow are variables that should not be managed in a subclass
  public boolean done = false;

  // Will be true if on the last frame of the transtion before stopping
  public boolean beforeDone = false;

  protected void preTick() {
    // Do nothing
  }

  protected void postTick() {
    if (done) {
      beforeDone = false;
      return;
    }

    // Updates before done
    if (up && opacity >= end_opacity) {
      beforeDone = true;
    } else if (!up && opacity <= end_opacity) {
      beforeDone = true;
    } else {
      beforeDone = false;
    }
  }

  protected void tick() {
    preTick();
    _tick();
    postTick();
  }

  /**
   * Updates the opacity of the transtion
  */
  protected void _tick() {
    if (up) {
      if (opacity <= end_opacity) {
        opacity += step;
      } else {
        done = true;
      }
    } else {
      if (opacity >= end_opacity) {
        opacity -= step;
      } else {
        done = true;
      }
    }
  }

  public void _update(){
    fill(0, opacity);
    rect(0, 0, width, height);

    tick();
  }

  public void reset() {
    opacity = starting_opacity;
    done = false;
    beforeDone = false;
  }

  public Transition(Assets a, Variables v) { super(a, v); }
}
