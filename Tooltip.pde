/**
 * Shows a tooltip above the cards
*/
public class Tooltip extends Obj {
  public static final String ace = "Changes the value of the next placed card on a location to a 1";
  public static final String jack = "Moves the top card onto another random location";
  public static final String queen = "Decrements the value of the top card by 5";
  public static final String king = "Kills the top card on the location";

  public String def = "";
  public String s = def;
  public static final color c = #94a3b8;

  public int w = 750;
  public int h = 100;
  public int x = Snap.cw - w / 2;
  public int y = Snap.h - 275 - h / 2;

  protected void preUpdate() {
    super.preUpdate();

    if (m.curCardIndex == -1) {
      shouldUpdate = false;
      return;
    } else {
      shouldUpdate = true;
    }

    Card c = m.curPlayer.hand.cards.get(m.curCardIndex);

    if(c.num == Card.ace) {
      s = ace;
    } else if (c.num == Card.jack) {
      s = jack;
    } else if (c.num == Card.queen) {
      s = queen;
    } else if (c.num == Card.king) {
      s = king;
    } else {
      s = def;
    }
  }

  protected void _update() {
    fill(c);
    textAlign(CENTER);
    textSize(25);
    text(s, x, y, w, h);
  }

  public Tooltip(Snap app) { super(app); }
}
