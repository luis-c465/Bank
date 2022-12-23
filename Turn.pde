public class Turn extends Obj {
  public static final int x = Snap.cw;
  public static final int y = Snap.ch;

  public int round_x = x;
  public int round_y = y + 50;
  public String pName = "NULL";

  public EnterBtn enterBtn;

  protected void _setup() {
    enterBtn = new EnterBtn(m);
    enterBtn.setup();
  }

  protected void _update() {
    background(0);
    updatePlayer();
    textAlign(CENTER);
    text(pName + "'s turn", x, y);

    text("Round " + m.curRound, round_x, round_y);

    enterBtn.update();
    if (enterBtn.clicked) {
      m.turnOver = false;
      enterBtn.clicked = false;
      enterBtn.clicking = false;
    }
  }


  private void updatePlayer() {
    if (m.curTurn == 1) {
      pName = m.p1.name;
    } else if (m.curTurn == 2) {
      pName = m.p2.name;
    } else {
      pName = "NULL";
    }
  }

  private class EnterBtn extends KeyboardBtn {
    protected void _setup() {
      x = m.cw;
      y = 800;

      w = 200;
      h = 100;
      img = a.enter;

      kc = ENTER;
    }

    public EnterBtn(Snap app) { super(app); }
  }

  public Turn(Snap app) { super(app); }
}
