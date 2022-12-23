/**
 * Header for the game
 * Shows who's turn it currently is and how many rounds are remaining in the game
*/
public class Header extends Obj {
  public int x = 0;
  public int y = 0;
  public int w = Snap.w;
  public int h = 100;

  protected void _update() {
    fill(255);
    text(m.curPlayer.name + "'s turn!", m.cw, 50);
  }

  public Header(Snap app) { super(app); }
}
