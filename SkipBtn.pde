/**
 * When clicked goes to the next round
 * Will show either skip turn of go to next round based on how many turns are remaining
 * Above the button text will show how many more cards can be placed
*/
public class SkipBtn extends Btn {
  public int txt_cards_x;
  public int txt_cards_y;

  public static final String skip = "Skip Turn";
  public static final String end = "End Turn";

  protected void _setup() {
    w = 200;
    x = m.w - w - 10;
    y = m.h - h / 2 - 20;

    txt = skip;
    icon = a.cont;
    icon_space = 70;
    txt_space = 20;

    cornerToCenter();

    txt_cards_x = x;
    txt_cards_y = y - h;
  }

  protected void _update() {
    super._update();

    textAlign(CENTER);
    fill(255);
    textSize(20);
    text(
      "" + (m.curRound - m.numTurns) + " / " + m.curRound + " cards to place",
      txt_cards_x,
      txt_cards_y
    );
  }

  protected void preUpdate() {
    super.preUpdate();

    // Update the txt
    // and maybe the icon
    if (m.numTurns < m.curRound) {
      txt = end;
    } else {
      txt = skip;
    }
  }

  public SkipBtn(Snap app) { super(app); }
}
