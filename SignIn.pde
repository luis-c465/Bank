public class SignIn extends Obj {
  public boolean trans = false;
  public boolean done = false;
  public boolean correct = true;

  private static final int wrong_y = 700;
  private static final color wrong_color = #dc2626;

  public static final String password = "password";
  public static final String username = "admin";
  public SignInBtn signInBtn;

  private Textfield usernameField;
  private Textfield passwordField;

  public void _setup() {
    usernameField = v.cp5.addTextfield("username");
    usernameField
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

    passwordField = v.cp5.addTextfield("password");
    passwordField
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

    signInBtn = new SignInBtn(app);
    signInBtn.setup();

    // TODO: remove
    v.signedIn = true;
              v.cp5.getController("username").remove();
          v.cp5.getController("password").remove();
  }

  public void _update() {
    if (v.signedIn) {
      if (trans) { transition(); }

      return;
    }

    if (
      signInBtn.clicked
    ) {
      if (usernameField.getText().equals(username) && passwordField.getText().equals(password)) {
        trans = true;
      } else {
        correct = false;
      }
    }

    signInBtn.update();
    imageMode(CORNERS);
    image(a.signIn, 0, 0);

    if (!correct) {
      push();

      textSize(16);
      textAlign(CENTER);
      fill(wrong_color);
      text("Wrong username / password", v.cw, wrong_y);

      pop();
    }


    if (trans) { transition(); }
  }

  private void transition() {
    if (!transitionIn.done) {
        transitionIn.update();

        if (transitionIn.beforeDone) {
          v.signedIn = true;
          v.cp5.getController("username").remove();
          v.cp5.getController("password").remove();
        }
      }
    else {
      if (!transitionOut.done) {
        transitionOut.update();
      }
    }

    if (transitionIn.done && transitionOut.done) {
      trans = false;
      done = true;

      transitionIn.reset();
      transitionOut.reset();
    }
  }

  public void mousePressed() {
    signInBtn.mousePressed();
  }

  public SignIn(BankApp app) { super(app); }
}
