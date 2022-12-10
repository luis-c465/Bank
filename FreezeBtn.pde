public class FreezeBtn extends Btn {
  public void _setup() {
    x = Sidebar.w + AccountViewer.padding;
    y = AccountViewer.btns_start;
    w = 150;

    hasIcon = true;
    txt = "Freeze";
    c = #5a95fd;
    txt_c = 255;
    txt_size = 17;
    txt_space = 30;

    icon = a.snowflake;
    icon_space = 40;
    icon_y_mod = 5;

    cornerToCenter();
  }

  protected void preUpdate() {
    push();

    // Update the text
    if (v.curAcc == null) return;

    // Else set the text equal to the opposite of the current status of the frozen account
    txt = !v.curAcc.frozen ? "Unfreeze" : "Freeze";
  }

  public FreezeBtn(BankApp app) { super(app); }
}
