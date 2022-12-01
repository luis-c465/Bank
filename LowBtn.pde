public class LowBtn extends Btn {
  public void _setup() {
    x = btn_safe;
    y = v.h - btn_safe;

    cornerToCenter();
    icon = a.down;
    icon_size = 100;

    txt = "Low";

    icon_y_mod = 15;
  }

  public LowBtn(Assets a, Variables v) { super(a, v); }
}
