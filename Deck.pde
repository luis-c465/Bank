public class Deck {
  public LinkedList<Card> cards = new LinkedList();

  public Deck() {
    for (int n = 1; n <= 13; n++) {
      for (Suit s : Suit.values()) {
        Card c = new Card(n, s);
        cards.add(c);
      }
    }
  }

  public String toString() {
    return cards.toString();
  }
}
