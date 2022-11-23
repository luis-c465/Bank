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

  /**
   * Shuffles the cards and then deals them to the players
   * !Note: Cards are not actually removed from the cards list
   *   They are just shuffled and then iterated through
   */
  public void deal(Player p, Enemy e) {
    // Shuffle the cards
    Collections.shuffle(cards);

    for(int i = 0; i < cards.size(); i++) {
      boolean even = i % 2 == 0;
      Card c = cards.get(i);

      if (even) {
        p.cards.add(c);
      } else {
        e.cards.add(c);
      }
    }
  }
}
