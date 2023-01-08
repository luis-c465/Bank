public class Hand extends Obj implements ICardHolder {
  public LinkedList<Card> cards = new LinkedList();
  public LinkedList<ClickableCard> drawCards = new LinkedList();

  // * DRAWING CONSTANTS
  public static final int overlap = 20;
  public int cards_space = Card.w - overlap;
  public int x_cards_start = Snap.cw + (int)(cards_space * 1.5);
  public int y_cards = Snap.h - 20;

  public static final int x_txt = Snap.cw;
  public int y_txt = y_cards - 50;

  protected void _setup() {
    updateCards();
  }

  protected void _update() {
    updateCards();

    for (int i = drawCards.size() - 1; i>=0; i--) {
      ClickableCard c = drawCards.get(i);

      c.update();

      // Do not let the play more then their current num of turns
      // TODO: Show an error msg on the screen if they are out of turns
      if (c.clicked && numTurns >= 1) {
        m.curCardIndex = c.i;
      }
    }
  }

  protected void updateCards() {
    if (drawCards.size() == 0 && cards.size() != 0) {
      for (int i=0; i<cards.size(); i++) {
        addCard(i);
      }
    } else if (drawCards.size() < cards.size()) {
      // The cards will always be added to the end of the array
      for (int i=drawCards.size() - 1; i < cards.size(); i++) { //<>//
        addCard(i); //<>//
      }
    } else if (drawCards.size() > cards.size()) {
      for (int i=0; i<cards.size(); i++) {
        ClickableCard cc = drawCards.get(i);
        Card c = cards.get(i);

        // They should both have the same reference!
        if (cc.c != c) {
          drawCards.remove(i);
        }
      }

      if (drawCards.size() > cards.size()) {
        // Trims the draw cards array to the size of the cards array
        // ? https://stackoverflow.com/a/22802295
        drawCards.subList(cards.size(), drawCards.size()).clear();
      }

      // Cursed but who cares
      for (int i=0; i<drawCards.size(); i++) {
        ClickableCard cc = drawCards.get(i);
        cc.i = i;
        cc.recalc();
      }
    } else {
      // Do nothing lol
    }
  }

  private class ClickableCard extends Clickable {
    public int i = -1;
    public Card c;
    public Hand hand;
    public int y_step = 5;
    public int max_y;
    public int min_y;

    protected void _setup() {
      w = Card.w;
      h = Card.h;
      x = hand.x_cards_start - cards_space * i;
      y = hand.y_cards;

      cornerToCenter();
      max_y = y;
      min_y = y - 50;

      canMove = true;
    }

    public void recalc() {
      x = hand.x_cards_start - cards_space * i + w/2;
    }

    protected void updateCorners() {
      super.updateCorners();
      right -= Hand.overlap * 2;
    }

    protected void _update() {
      imageMode(CENTER);
      image(a.getCard(c), x, y, Card.w, Card.h);

      if (hovered || curCardIndex == i) {
        if (y > min_y) {
          y -= y_step;
        }
      } else if (y < max_y) {
        y += y_step;
      }
    }

    public ClickableCard(Snap app) { super(app); }
  }

  protected void addCard(int i) {
      ClickableCard cc = new ClickableCard(m);
      Card c = cards.get(i);

      cc.i = i;
      cc.c = c;
      cc.hand = this;

      cc.setup();
      drawCards.add(cc);
  }

  public void add(Card c) {
    cards.add(c);
  }

  public String toString() {
    return cards.toString();
  }

  public Hand(Snap app) { super(app); }
}
