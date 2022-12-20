public abstract class CardHolder extends Obj {
  public LinkedList<Card> cards = new LinkedList();

  public CardHolder(Snap app) {
    super(app);
  }

  public String toString() {
    return cards.toString();
  }
}
