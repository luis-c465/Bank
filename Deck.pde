public class Deck extends Obj {
  // * DRAWING CONSTANTS
  final int x_deck = 200;
  final int y_deck = 500;

  int x_hand;
  int y_hand = 500;

  public LinkedList<Card> cards = new LinkedList();
  public Card hand;
  public PImage hand_img;

  public final int flip_cycles_end = 5;
  public int flipCycles = flip_cycles_end;

  /**
   * Generates a deck then shuffles it
   */
  public Deck(Assets a, Variables v) {
    super(a, v);

    for (int n = 2; n <= 14; n++) {
      for (Suit s : Suit.values()) {
        Card c = new Card(n, s);
        cards.add(c);
      }
    }

    // Shuffle the cards
    Collections.shuffle(cards);
    hand = cards.remove();
  }

  public String toString() {
    return hand.toString();
  }

  /**
   * Deals the top card to the player
   */
  public void hardDeal(Player p) {
    p.hand = cards.remove();
    updateHandImg();
  }

  public void setup() {
    x_hand = v.cw;
  }

  public void _update() {
    drawDeck();
    drawHand();

    if (v.hasVoted && !v.isFlippingHand) {
      v.flip = true;
      v.isFlippingHand = true;
    }
  }

  protected void drawDeck() {
    push();

    // If cards are left in the deck
    if (cards.size() > 0) {
      image(a.back, x_deck, y_deck, Card.w, Card.h);
    }

    pop();
  }

  protected void drawHand() {
    if (!v.flip) {
      image(a.back, x_hand, y_hand, Card.w, Card.h);
    } else {
      // guh flip the thing
      image(hand_img, x_hand, y_hand, Card.w, Card.h);
    }

  }

  private void updateHandImg() {
    hand_img = a.getCard(hand);
  }
}
