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

  public boolean vote = false;
  public boolean hasVoted = false;
  public Round check = Round.TIE;

  public boolean flip = false;
  public boolean isFlippingHand = false;


  public void _setup() {
    h = height;
    w = width;

    ch = h / 2;
    cw = w / 2;
  }
}
