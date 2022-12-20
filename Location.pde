public class Location extends Clickable {
  public LinkedList<Card> p1 = new LinkedList();
  public LinkedList<Card> p2 = new LinkedList();

  protected int p1Len = 0;
  protected int p2Len = 0;

  protected int p1Scor = 0;
  protected int p2Scor = 0;

  public static final int space = 200;
  public static final int gap = 100;

  public int i = -1;

  // ? Processing moment
  public int y_score_above = Snap.ch - Card.h - 10;
  public int y_score_bellow = Snap.ch + Card.h + 10;

  protected void _setup() {
    x = m.cw + space * i;
    y = m.ch;

    w = Card.w;
    h = Card.h;
  }

  protected void _update() {
    // Draw the image
    imageMode(CENTER);
    image(getTop(), x, y, Card.w, Card.h);

    // show the current players cards score bellow the card
    // show the other players score above the card

    textAlign(CENTER);
    if (curTurn == 1) {
      text("" + p1Scor, x, y_score_bellow);
      text("" + p2Scor, x, y_score_above);
    } else if (curTurn == 2) {
      text("" + p2Scor, x, y_score_bellow);
      text("" + p1Scor, x, y_score_above);
    }

    if (clicked && m.curCard != null) {
      // handle adding the card to that location based on the current player
      if (curTurn == 1) {
        p1.add(curCard);
        m.curCard = null;
      } else if (curTurn == 2) {
        p2.add(curCard);
        m.curCard = null;
      }
    }
  }

  protected void preUpdate() {
    super.preUpdate();

    if (p1.size() != p1Len) {
      p1Scor = sum(p1);
      p1Len = p1.size();
    } else if (p2.size() != p2Len) {
      p2Scor = sum(p2);
      p2Len = p2.size();
    }
  }

  protected PImage getTop() {
    PImage card = null;

    try {
      if (curTurn == 1) {
        a.getCard(p1.get(p1.size() - 1));
      } else if (curTurn == 2) {
        a.getCard(p2.get(p2.size() - 1));
      }
    } catch (Exception e) {
      // dont care
    }

    if (card != null) {
      return card;
    } else {
      return a.back;
    }
  }

  protected int sum(List<Card> cards) {
    int sum = 0;
    for(Card c : cards) {
      sum += c.num;
    }

    return sum;
  }

  public Location(Snap app, int i) { super(app); this.i = i; }
}
