public class NewAccBtn extends Btn {
  public void _setup() {
    w = Sidebar.w - btn_safe * 4;

    x = btn_safe * 2;
    y = v.h - btn_safe;

    hasIcon = true;
    txt = "New account";
    c = #5a95fd;
    txt_c = 255;
    txt_size = 25;
    txt_space = 20;

    icon = a.userPlus;
    icon_size = 50;
    icon_space = 100;
    icon_y_mod = 5;

    cornerToCenter();
  }

  public NewAccBtn(BankApp app) { super(app); }
}
