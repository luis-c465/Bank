public class Enemy extends Obj {
  public Queue<Card> cards = new LinkedList();

  public Enemy(Assets a, Variables v) {
    super(a, v);
  }

  public String toString() {
    return "Enemy: " +  cards.toString();
  }

  public void _update() {
    //
  }
}
