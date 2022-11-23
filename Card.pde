/**
 * Class for a card
 */
public class Card {
  public int num;
  public Suit suit;
  public String s;
  public String c = "?";

  /**
   * Generates a card with a given value [1, 13]
   */
  public Card(int num, Suit s) {
    this.num = num;
    this.suit = s;

    // Assign a character
    if (num == 1) {
      c = "A";
    } else if (num >= 2 && num <= 10) {
      c = "" + num;
    } else if (num == 11){
      c = "J";
    } else if (num == 12) {
      c = "Q";
    } else if (num == 13) {
      c = "K";
    }

    this.s = "" + c + " of " + s.name();
  }

  public String toString() {
    return s;
  }
}
