public class GameOver extends Transitionable {
  // * DRAWING CONSTANTS
  public int txt_size = 50;
  public static final int txt_h = Snap.ch - 200;

  public int p1Scor = 0;
  public int p2Scor = 0;
  public String winnerName = null;
  public boolean alreadyCalculated = false;
  public boolean tie = false;

  protected void _setup() {
    shouldUpdate = false;
  }

  protected void preUpdate() {
    super.preUpdate();

    // Calculate the winner
    if (m.gOver && !alreadyCalculated) {
      calc();

      trans = true;
      alreadyCalculated = true;

      clean();
    }
  }

  protected void _update() {
    textAlign(CENTER);
    imageMode(CENTER);

    if (tie) {
      text("GAME TIED", m.cw, m.ch);
    } else {
      text(winnerName + " WON the game!", m.cw, txt_h);
      image(a.king, 500, 700);
    }
  }

  protected void onTransOutBegin() {
    paused = true;
    shouldUpdate = true;
  }

  // Calculates the winner for the game
  private void calc() {
    // Calculate the scores
    m.l1.calc();
    m.l2.calc();
    m.l3.calc();

    if (m.l1.p1Scor > m.l1.p2Scor) {
      p1Scor++;
    } else if (m.l1.p1Scor < m.l1.p2Scor) {
      p2Scor++;
    }

    if (m.l2.p1Scor > m.l2.p2Scor) {
      p1Scor++;
    } else if (m.l2.p1Scor < m.l2.p2Scor) {
      p2Scor++;
    }

    if (m.l3.p1Scor > m.l3.p2Scor) {
      p1Scor++;
    } else if (m.l3.p1Scor < m.l3.p2Scor) {
      p2Scor++;
    }

    if (p1Scor > p2Scor) {
      winnerName = m.p1.name;
    } else if (p2Scor > p1Scor) {
      winnerName = m.p2.name;
    } else {
      tie = true;
    }
  }

  public GameOver(Snap app) { super(app); }
}
