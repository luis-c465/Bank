public class GameOver extends Transitionable {
  public int p1Scor = 0;
  public int p2Scor = 0;
  public String winnerName = null;
  public boolean begin = false;
  public boolean tie = false;

  protected void preUpdate() {
    super.preUpdate();

    // Calculate the winner
    if(begin) {
      calc();

      trans = true;
      begin = false;
    }
  }

  protected void _update() {
    // update
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
