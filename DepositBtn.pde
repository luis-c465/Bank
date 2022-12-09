public class DepositBtn extends Btn {
  public void _setup() {
    x = v.accViewer.amount_input_x + v.accViewer.amount_input_w + btn_safe * 24;
    y = v.accViewer.amount_input_y + v.accViewer.amount_input_h / 2;
    w = 150;

    hasIcon = true;
    txt = "Deposit";
    c = #5a95fd;
    txt_c = 255;
    txt_size = 20;
    txt_space = 30;

    icon = a.plus;
    icon_space = 40;
    icon_y_mod = 5;
  }

  public DepositBtn(BankApp app) { super(app); }
}
