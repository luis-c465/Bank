public class ConfirmNewAccBtn extends Btn {
  public void _setup() {
    w = Sidebar.w - btn_safe * 4;

    x = v.cw;
    y = 700;

    hasIcon = true;
    txt = "Create new account";
    c = #5a95fd;
    txt_c = 255;
    txt_size = 25;
    txt_space = 0;

    hasIcon = false;
    cornerToCenter();
  }

  public ConfirmNewAccBtn(BankApp app) { super(app); }
}
