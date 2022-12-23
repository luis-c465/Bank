public class Dealer {
  public LinkedList<Card> cards = new LinkedList();

  public Dealer() {
    for (int n = 1; n <= 13; n++) {
      for (Suit s : Suit.values()) {
        Card c = new Card(n, s);
        cards.add(c);
      }
    }

    // Shuffle the cards
    Collections.shuffle(cards);
  }

  /**
   * Deals n cards to the card holder
  */
  public void deal(ICardHolder c, int n) {
    for(int i =0; i<n; i++) {
      c.add(cards.remove());
    }
  }
}
