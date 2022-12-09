public class WithdrawBtn extends Btn {
  public void _setup() {
    x = v.accViewer.amount_input_x + v.accViewer.amount_input_w + btn_safe * 8;
    y = v.accViewer.amount_input_y + v.accViewer.amount_input_h / 2;
    w = 150;

    hasIcon = true;
    txt = "Withdraw";
    c = #5a95fd;
    txt_c = 255;
    txt_size = 17;
    txt_space = 30;

    icon = a.minus;
    icon_space = 40;
    icon_y_mod = 5;
  }

  public WithdrawBtn(BankApp app) { super(app); }
}
