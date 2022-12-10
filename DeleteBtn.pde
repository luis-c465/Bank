public class DeleteBtn extends Btn {
  public void _setup() {
    x = Sidebar.w + AccountViewer.padding + w + btn_safe;
    y = AccountViewer.btns_start;
    w = 150;

    hasIcon = true;
    txt = "Delete";
    c = #5a95fd;
    txt_c = 255;
    txt_size = 17;
    txt_space = 30;

    icon = a.trash;
    icon_space = 40;
    icon_y_mod = 5;

    cornerToCenter();
  }

  public DeleteBtn(BankApp app) { super(app); }
}
