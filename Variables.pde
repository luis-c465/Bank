/**
 * Class whitch contains helper variables for drawing to the canvas
 *
 * Instead of calculateing these variables each render they are assetsed here
 * for easy access
 */
public class Variables {
  public static final int h = 1000;
  public static final int w = 1000;

  public static final int ch = 500;
  public static final int cw = 500;

  public boolean transitioning = false;

  // * CLASSES
  ControlP5 cp5;
  public TransitionIn transIn;
  public TransitionOut transOut;


  public void setup(Snap app) {
    // Setup the class for inputs
    cp5 = new ControlP5(app);
  }
}
