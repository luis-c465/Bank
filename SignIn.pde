public class SignIn extends Obj {
  public void _setup() {
    v.cp5.addTextfield("username")
      .setPosition(500 - 100 ,500)
      .setSize(200,40)
      .setFocus(true)
      .setColor(color(0))
      .setColorForeground(0)
      .setColorBackground(#ffffff)
      .setLabelVisible(true)
      .setCaptionLabel("Username")
      .setColorCaptionLabel(#000000)
      .setFont(a.nunito_small)
      ;

    v.cp5.addTextfield("password")
      .setPosition(500 - 100 ,600)
      .setSize(200,40)
      .setFocus(true)
      .setColor(color(0))
      .setColorForeground(0)
      .setColorBackground(#ffffff)
      .setLabelVisible(true)
      .setCaptionLabel("Password")
      .setColorCaptionLabel(#000000)
      .setPasswordMode(true)
      .setFont(a.nunito_small)
      ;
  }

  public void _update() {
    if (v.signedIn) return;

    imageMode(CORNERS);
    image(a.signIn, 0, 0);
  }

  public SignIn(Assets a, Variables v) { super(a, v); }
}
