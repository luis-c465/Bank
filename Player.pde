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

  public Player(Snap app) {
    super(app);
    deck = new Deck(app);
    hand = new Hand(app);
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
}
