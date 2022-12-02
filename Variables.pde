/**
 * Class whitch contains helper variables for drawing to the canvas
 *
 * Instead of calculateing these variables each render they are assetsed here
 * for easy access
 */
public class Variables {
  public int h;
  public int w;

  public int ch;
  public int cw;

  public boolean vote = false;
  public boolean hasVoted = false;
  public Round check = Round.TIE;

  public boolean flip = false;
  public boolean isFlippingHand = false;
  public boolean isFlippingHandBack = false;

  public boolean nextRound = false;

  public int totalCorrect = 0;
  public int currStreak = 0;
  public int highestStreak = 0;
  public int score = 0;

  public int roundNum = 1;
  public int roundMax = 8;

  public int game = 1;
  // TODO: Set to 8
  // 7 Rounds of the game
  public int games_max = 7;
  public Game[] games = new Game[games_max];

  public boolean transitioning = false;

  public Player player;
  public TransitionIn transIn;
  public TransitionOut transOut;


  public void _setup() {
    h = height;
    w = width;

    ch = h / 2;
    cw = w / 2;
  }
}
