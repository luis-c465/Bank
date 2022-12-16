/**
 * Class for a card
 */
public class Card implements Comparable<Card> {
  public static final double _ratio = 1.4953271028037383;  // 320.0 / 214
  public static final int w = 125;
  public static final int h = 187; // (int) Math.round(w * _ratio)

  public int num;
  public Suit suit;
  public String s;
  public String c = "?";
  // Color
  public String col;

  /**
   * Generates a card with a given value [1, 13]
   */
  public Card(int num, Suit s) {
    this.num = num;
    this.suit = s;

    col = getColor(s);

    // Assign a character
    if (num == 1) {
      c = "a";
    } else if (num >= 2 && num <= 10) {
      c = "" + num;
    } else if (num == 11){
      c = "j";
    } else if (num == 12) {
      c = "q";
    } else if (num == 13) {
      c = "k";
    }

    this.s = "" + c.toUpperCase() + getSuit();
  }

  public String getSuit() {
    switch(suit) {
      case CLUB:
        return "♣";
      case SPADE:
        return "♠";
      case HEART:
        return "♥";
      case DIAMOND:
        return "♦";
      default:
        return "□";
    }
  }

  @Override
  public int compareTo(Card o) {
      return Integer.compare(num, o.num);
  }

  public String toString() {
    return s;
  }

  private String getColor(Suit s) {
    switch(s) {
      case CLUB:
        return "r";
      case SPADE:
        return "b";
      case HEART:
        return "b";
      case DIAMOND:
        return "y";
      default:
        return "?";
    }
  }
}
