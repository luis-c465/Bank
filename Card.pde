/**
 * Class for a card
 */
public class Card implements Comparable<Card> {
  public static final double _ratio = 1.4953271028037383;  // 320.0 / 214
  public static final int w = 125;
  public static final int h = 187; // (int) Math.round(w * _ratio)

  public static final int ace = 1;
  public static final int jack = 11;
  public static final int queen = 12;
  public static final int king = 13;

  public int num;
  public Suit suit;
  public String s;
  public String c = "?";
  // Color
  public String col;
  public boolean bad = false;
  public boolean queened = false;

  /**
   * Generates a card with a given value [1, 13]
   */
  public Card(int num, Suit s) {
    this.num = num;
    this.suit = s;

    col = getColor(s);

    // Assign a character
    if (num == ace) {
      c = "a";
    } else if (num >= 2 && num <= 10) {
      c = "" + num;
    } else if (num == jack){
      c = "j";
    } else if (num == queen) {
      c = "q";
    } else if (num == king) {
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
