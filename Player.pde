public class Player extends CardHolder {
  public String name;
  public int totalCorrect = 0;
  public int currStreak = 0;
  public int highestStreak = 0;
  public int score = 0;

  public Player(Assets a, Variables v) {
    super(a, v);
  }

  // TODO: Add methods to get new card and to check cards

  public String toString() {
    return "Player: " + name + "\n " + super.toString();
  }

  public void _update() {
    //
  }
}
