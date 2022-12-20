/**
 * Class whitch contains information about the player
 * A player has a deck and a hand of cards
 *
 * The player can click on c ard and click on the location they want to place the card on
*/
public class Player extends CardHolder {
  public Deck deck;
  public int num = -1;
  public String name = "!!GUH!!";

  public Player(Snap app) {
    super(app);
    deck = new Deck(app);
  }

  protected void _setup() {
    deck.setup();
  }

  protected void _update() {
    deck.update();
  }

  public String toString() {
    return "Cards: " + cards.toString() + "\n Deck: " + deck.toString();
  }
}
