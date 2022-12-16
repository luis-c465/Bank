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

  // Game classes
  public Dealer dealer;
  public Player p1;
  public Player p2;

  public void setup(Snap app) {
    // Setup the class for inputs
    cp5 = new ControlP5(app);

    transIn = new TransitionIn(app);
    transOut = new TransitionOut(app);

    dealer = new Dealer();
    p1 = new Player(app);
    p2 = new Player(app);

    dealer.deal(p1,5);
    dealer.deal(p1.deck,7);

    dealer.deal(p2,5);
    dealer.deal(p2.deck,7);

    println(p1);
    println(p2);
  }
}
