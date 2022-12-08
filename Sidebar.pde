/**
 * Dispaly the sidebar for the bank app
 * whitch contains Accounts registered in the bank and at the bottom a button to add a new user
*/
public class Sidebar extends Obj {
  public static final int w = 350;
  public static final color c = #d4d4d4;
  AccountDrawer accDrawer;

  protected void _update() {
    drawBg();
    drawAccounts();
  }

  private void drawBg() {
    fill(c);
    shapeMode(CORNERS);
    rect(0, 0, w, v.h);
  }

  private void drawAccounts() {
    for (int i=0; i < v.accounts.size(); i++) {
      accDrawer.draw(i);
    }
  }

  public void _setup() {
    accDrawer = new AccountDrawer(app);
  }

  public void mousePressed() {
    for (int i=0; i < v.accounts.size(); i++) {
      accDrawer.mousePressed(i);
    }
  }

  public Sidebar(BankApp app) { super(app); }
}
