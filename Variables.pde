/**
 * Class whitch contains helper variables for drawing to the canvas
 *
 * Instead of calculateing these variables each render they are assetsed here
 * for easy access
 */
public class Variables {
  public int h;
  public int w;

  public int ch;
  public int cw;

  ControlP5 cp5;

  public boolean transitioning = false;
  public boolean signedIn = false;

  public TransitionIn transIn;
  public TransitionOut transOut;
  ArrayList<Account> accounts = new ArrayList<Account>();


  public void _setup() {
    h = height;
    w = width;

    ch = h / 2;
    cw = w / 2;
  }
}
