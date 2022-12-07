public class Intro extends Obj {
  public boolean show = false;
  public boolean trans = false;
  public boolean done = false;


  public void _update() {
    if (!show) {
      if (trans) { transition(); }

      return;
    }

    imageMode(CORNERS);
    image(a.intro, 0, 0, v.w, v.h);

    if (trans) { transition(); }
  }

  private void transition() {
    if (!transitionIn.done) {
        transitionIn.update();

        if (transitionIn.opacity > 255) {
          show = false;
        }
      }
    else {
      if (!transitionOut.done) {
        transitionOut.update();
      }
    }

    if (transitionIn.done && transitionOut.done) {
      trans = false;
      done = true;
      transitionIn.reset();
      transitionOut.reset();
    }
  }

  public void keyPressed() {
    if (!done && keyCode == ENTER) {
      trans = true;
    }
  }

  public Intro(BankApp app) { super(app); }
}
