public class Location extends Clickable {
  public LinkedList<CardInfo> cards = new LinkedList();

  protected int len;
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
    image(
      getTop(),
      x,
      y,
      Card.w,
      Card.h
    );

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

    // If the elocation was clicked on
    // and the card index is a valid card
    // and the curent turn is -1 (to prevent crashes)
    // and the number of cards already on the location is bellow the limit
    if (clicked && m.curCardIndex >= 0 && curTurn != -1 && cards.size() < 4) {
      // handle adding the card to that location based on the current player
      Card c = m.curPlayer.hand.cards.remove(curCardIndex);
      cards.add(new CardInfo(c, m.curPlayer));

      // Update global variables
      m.curCardIndex = -1;
      numTurns--;
    }
  }

  protected void preUpdate() {
    super.preUpdate();

    if (cards.size() != len) {
      p1Scor = 0;
      p2Scor = 0;

      for(CardInfo c : cards) {
        if (c.player.num == 1) {
          p1Scor += c.card.num;
        } else if (c.player.num == 2) {
          p2Scor += c.card.num;
        }
      }

      len = cards.size();
    }
  }

  private PImage getTop() {
    if (cards.size() == 0) {
      return a.back;
    }

    Card c = (cards.get(cards.size() - 1)).card;
    return a.getCard(c);
  }


  // Wrapper class for contianing information about the cards in the location
  private class CardInfo {
    public Card card;
    public Player player;

    public CardInfo(Card c, Player p) {
      card = c;
      player = p;
    }
  }

  public Location(Snap app, int i) { super(app); this.i = i; }
}
