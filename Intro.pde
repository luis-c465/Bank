public class Intro extends Obj {
  public boolean show = true;
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
    if (!v.transIn.done) {
        v.transIn.update();

        if (v.transIn.opacity > 255) {
          show = false;
        }
      }
    else {
      if (!v.transOut.done) {
        v.transOut.update();
      }
    }

    if (v.transIn.done && v.transOut.done) {
      trans = false;
      done = true;
      v.transIn.reset();
      v.transOut.reset();
    }
  }

  public void keyPressed() {
    if (!done && keyCode == ENTER) {
      trans = true;
    }
  }

  public Intro(Snap app) { super(app); }
}
