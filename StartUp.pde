/**
 * Class whitch displays the startup screen
 * Shows 2 inputs for both players names
*/
public class StartUp extends Transitionable {
  private Textfield p1Name;
  private Textfield p2Name;
  private StartGameBtn startGameBtn;

  // * DRAWING CONSTANTS
  private static final int   name_w = 200;
  private static final int   name_h = 50;
  private static final int   name_txt_s = 25;
  private              int   name_x = m.cw - name_w / 2;
  private static final int   name_gap = 100;
  private static final color name_bg_c = #374151;
  private static final color name_txt_c = #ffffff;
  private static final color name_label_c = #64748b;

  // Constants different for each input
  private int p1Name_y = m.ch - name_h - name_gap;
  private int p2Name_y = m.ch - name_h + name_gap;
  private int vs_y = m.ch + 15;

  protected void _setup() {
    p1Name = m.cp5.addTextfield("player1Name")
      .setPosition(name_x, p1Name_y)
      .setSize(name_w, name_h)
      .setFont(a.nunito_small)
      .setFocus(true)
      .setColor(name_txt_c)
      .setColorForeground(name_txt_c)
      .setColorBackground(name_bg_c)
      .setCaptionLabel("Player 1 Name")
      .setLabelVisible(true)
      .setColorCaptionLabel(name_label_c)
      .hide();
      ;

    p2Name = m.cp5.addTextfield("player2Name")
      .setPosition(name_x, p2Name_y)
      .setSize(name_w, name_h)
      .setFont(a.nunito_small)
      .setColor(name_txt_c)
      .setColorForeground(name_txt_c)
      .setColorBackground(name_bg_c)
      .setCaptionLabel("Player 2 Name")
      .setLabelVisible(true)
      .setColorCaptionLabel(name_label_c)
      .hide();
      ;

    startGameBtn = new StartGameBtn(m);
    startGameBtn.setup();
  }

  protected void _update() {
    if (done) {
      p1Name.hide();
      p2Name.hide();
      paused = true;
      return;
    }

    // Else show the text boxes
    p1Name.show();
    p2Name.show();
    startGameBtn.update();

    // Show vs text
    textFont(a.nunito);
    textAlign(CENTER);
    fill(255);
    text("VS", m.cw, vs_y);

    checkBtns();
  }

  // Check is the button was clicked
  private void checkBtns() {
    if(startGameBtn.clicked) {
      // Start transitioning into the game
      println("Starting game!");

      m.p1.name = p1Name.getText();
      m.p2.name = p2Name.getText();

      p1Name.remove();
      p2Name.remove();

      // Begin transitioning!
      trans = true;

    }
  }

  protected void onTransOutBegin() {
    onDone();
  }

  private  class StartGameBtn extends Btn {
    public void _setup() {
      x = m.cw;
      y = 800;
      w = 200;

      txt = "Start Game";
      c = #0ea5e9;
      txt_size = 20;
      txt_c = 255;
      txt_space = 30;

      icon = a.play;
      icon_space = 60;
      icon_y_mod = 5;
    }

    public StartGameBtn(Snap app) { super(app); }
  }


  public StartUp(Snap app) { super(app); }
}
