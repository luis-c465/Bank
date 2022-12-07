/**
 * Transitions in between 2 screens
 *
 * The update method should be called durring each draw for this to work
 */
public class TransitionIn extends Transition {
  public TransitionIn(BankApp app) {
    super(app);
    v.transIn = this;

    starting_opacity = 0;
    opacity = starting_opacity;
    end_opacity = 255;
    up = true;
    step = 8;
  }

}
