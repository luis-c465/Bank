/**
 * Dispaly the sidebar for the bank app
 * whitch contains Accounts registered in the bank and at the bottom a button to add a new user
*/
public class Sidebar extends Obj {
  public static final int w = 350;
  public static final color c = #f1f5f9;

  protected void _update() {
    drawBg();
  }

  private void drawBg() {
    fill(c);
    shapeMode(CORNERS);
    rect(0, 0, w, v.h);
  }

  public Sidebar(BankApp app) { super(app); }
}
