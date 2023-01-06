/**
 * Class whitch contains information about the player
 * A player has a deck and a hand of cards
 *
 * The player can click on c ard and click on the location they want to place the card on
*/
public class Player extends Obj {
  public Deck deck;
  public Hand hand;
  public int num = -1;
  public String name = "!!GUH!!";

  public Player(Snap app, int num) {
    super(app);
    deck = new Deck(app);
    hand = new Hand(app);
    this.num = num;
  }

  protected void _setup() {
    deck.setup();
    hand.setup();
  }

  protected void _update() {
    deck.update();
    hand.update();
  }

  public String toString() {
    return "Cards: " + hand.toString() + "\n Deck: " + deck.toString();
  }

  public boolean hasCards() {
    return (deck.cards.size() + hand.cards.size()) > 0;
  }

  public boolean hasSpecialCard() {
    for (Card c : deck.cards) {
      if (c.num >= Card.jack) {
        return true;
      }
    }

    for (Card c : hand.cards) {
      if (c.num >= Card.jack) {
        return true;
      }
    }

    return false;
  }
}
