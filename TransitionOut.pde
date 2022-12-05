public class TransitionOut extends Transition {
  public TransitionOut(Assets a, Variables v) {
    super(a, v);
    v.transOut = this;

    starting_opacity = 255;
    opacity = starting_opacity;
    end_opacity = 0;
    up = false;
    step = 4;
  }
}
