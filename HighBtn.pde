public class HighBtn extends Btn {
  public void _setup() {
    x = btn_safe + 200;
    y = v.h - btn_safe;

    cornerToCenter();
    icon = a.up;
    icon_size = 100;

    txt = " High";

    icon_y_mod = 15;
  }

  public HighBtn(Assets a, Variables v) { super(a, v); }
}
