public class ScoreBar extends Obj {
  public static final int h = 50;
  public static final color c = #111827;
  public static final int txt_size = 30;

  public void _update() {
    rectMode(CORNERS);
    fill(c);
    rect(0, 0, v.w, h);

    // Font color
    fill(225);
    textSize(txt_size);
    textAlign(LEFT, TOP);
    String s = "Correct: " + v.totalCorrect +
     "        Score: " +  v.score +
     "        Cur Streak: " + v.currStreak +
     "        Highest Streak: " + v.highestStreak ;
    text(s, 0, 0);
  }

  public ScoreBar(Assets a, Variables v) { super(a, v); }
}
