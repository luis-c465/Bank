/**
 * Draws a round transition to the screen when the round is finished
 *
 * Should call `.update()` at the end of the draw function
*/
public class GameTrans extends Obj {
  public int start_games_y = 200;
  public boolean transOut = false;
  public boolean alreadyTransitioned = false;

  public final int space_btn_y = 850;

  public void _update() {
    if (v.roundNum != v.roundMax) { alreadyTransitioned = false; return; }
    if (alreadyTransitioned) { return; }

    if (v.games[v.game-1] == null) {
      Game g = new Game();

      g.totalCorrect = v.totalCorrect;
      g.currStreak = v.currStreak;
      g.highestStreak = v.highestStreak;
      g.score = v.score;

      v.games[v.game-1] = g;
    }

    // Show the rounds

    // Transition in
    if (!transOut) {
      transitionIn.update();
    } else {
      transitionOut.update();
      fill(255, transitionOut.opacity);
      drawGames();

      if (transitionOut.done) {
        // Then update the roundNum variable
        // and reset the transition classes
        alreadyTransitioned = true;
        transOut = false;
        v.roundNum = 1;
        v.game++;

        transitionIn.reset();
        transitionOut.reset();
      }
    }

    if (transitionIn.done && !transOut) {
      fill(255);
      drawGames();
      drawSpaceBtn();

      v.totalCorrect = 0;
      v.currStreak = 0;
      v.highestStreak = 0;
      v.score = 0;
    }
  }

  private void drawGames() {
    textSize(32);
    // White text
    for(int i =0; i<v.game; i++) {
      Game g = v.games[i];

      String space = "    ";
      String s = "Game : " + (i+1) +
        space + "Score: " + g.score +
        space + "Correct: " + g.totalCorrect +
        space + "Highest Streak: " + g.highestStreak;

      textAlign(CENTER);
      int y = start_games_y + i * 100;
      text(s, v.cw, y);
    }
  }

  private void drawSpaceBtn() {
    // TODO: Draw the space btn
    image(a.space, v.cw, space_btn_y);
    textSize(20);
    text("Press space to continue!", v.cw, space_btn_y + 100);
  }

  public void keyPressed() {
    // If the spacebar is pressed when the transitionIn is done begin to transiton out
    if (v.roundNum == v.roundMax && transitionIn.done && key == ' ') {
      transOut = true;
    }
  }

  public GameTrans(Assets a, Variables v) { super(a, v); }
}
