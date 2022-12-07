public class SignInBtn extends Btn {
  public void _setup() {
    x = v.cw;
    y = 800;
    hasIcon = false;
    txt = "Sign In";
    c = #5a95fd;
    txt_c = 255;
    txt_space = -2;
  }

  public SignInBtn(BankApp app) { super(app); }
}
