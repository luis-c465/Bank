public class Player extends Obj {
  // * DRAWING COSTANTS
  public int x_hand;
  public static final int y_hand = 800;

  public String name;
  public Card hand;

  public Player(Assets a, Variables v) {
    super(a, v);
  }

  public void setup() {
    x_hand = v.cw;
  }

  // TODO: Add methods to get new card and to check cards

  public String toString() {
    return "Player: " + name + "\n " + hand.toString();
  }

  /**
   * Draws the players hand
  */
  public void _update() {
    PImage card = a.getCard(hand);
    image(card, x_hand, y_hand, Card.w, Card.h);
  }
}
