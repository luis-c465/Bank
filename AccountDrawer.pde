public class AccountDrawer extends Obj {
  // The program can have a maximum number of 9 accounts loaded at once :(
  // Becuase else the accounts will not fit on the screen
  public static final int h = 110;
  public static final int img_w = 100;
  public static final int gap = 20;
  public static final int r = 10;
  public static final int p = 5;
  public static final int txt_size = 20;

  public int name_x = img_w + p;
  public int bottom = 33;

  /**
   * Draws the account at the given index
  */
  public void draw(int i) {
    Account acc = v.accounts.get(i);

    int y = i * h;

    fill(Sidebar.c);
    rect(0, y, Sidebar.w, y + h, r);

    imageMode(CORNERS);
    image(a.getAsset(acc), p, y, img_w, img_w + y);

    fill(0);
    textSize(25);
    textAlign(LEFT, TOP);
    text(acc.name, img_w + p, y + p);

    textSize(18);
    text(
      "$" + String.format("%,.2f", acc.amount) + (acc.frozen ? " FROZEN" : ""),
       name_x,
      y + p + bottom
     );

    text(
      "Id:" + acc.id,
      img_w + p,
      y + p + bottom * 2
     );
  }

  public void _update() {
    // Idk do nothing
  }

  public void mousePressed(int i) {
    int y = i * h;

    if (mouseX >= 0 && mouseX <= Sidebar.w && mouseY >= (y) && mouseY <= y + h) {
      v.curAcc = v.accounts.get(i);
      v.curAccIndex = i;
      v.newAcc = false;
    }
  }

  public AccountDrawer(BankApp app) { super(app); }
}
