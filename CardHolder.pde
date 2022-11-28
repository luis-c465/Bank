public abstract class CardHolder extends Obj {
  public Queue<Card> cards = new LinkedList();
  public Card cur;

  public CardHolder(Assets a, Variables v) {
    super(a, v);
  }

  public String toString() {
    return "cur: " + cur + "\nDeck: " + cards.toString();
  }

  /**
    * Removes the card at the top of the deck and updates the cur card
    * Returns false if the deck has no cards in it
   */
  public Card remove() {
    if (cards.size() <= 0)
      return null;

    Card c = cards.remove();
    cur = c;
    return c;
  }
}
