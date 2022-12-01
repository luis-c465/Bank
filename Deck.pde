public class Deck extends Obj {
  // * DRAWING CONSTANTS
  final int x_deck = 300;
  final int y_deck = 300;

  public LinkedList<Card> cards = new LinkedList();
  public Card hand;
  public boolean isFlipingHand = false;
  public final int flip_cycles_end = 5;
  public int flipCycles = flip_cycles_end;

  /**
   * Generates a deck then shuffles it
   */
  public Deck(Assets a, Variables v) {
    super(a, v);

    for (int n = 1; n <= 13; n++) {
      for (Suit s : Suit.values()) {
        Card c = new Card(n, s);
        cards.add(c);
      }
    }

    // Shuffle the cards
    Collections.shuffle(cards);
  }

  public String toString() {
    return hand.toString();
  }

  /**
   * Deals the top card to the player
   */
  public void hardDeal(Player p) {
    p.hand = cards.remove();
  }

  public void _update() {
    // render
  }

  protected void drawDeck() {
    push();

    // If cards are left in the deck
    if (cards.size() > 0) {
      image(a.back, x_deck, y_deck, Card.w, Card.h);
    }

    pop();
  }
}
