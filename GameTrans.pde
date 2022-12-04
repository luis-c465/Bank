/**
 * Draws a round transition to the screen when the round is finished
 *
 * Should call `.update()` at the end of the draw function
*/
public class GameTrans extends Obj {
  public int start_games_y = 200;
  public boolean transOut = false;
  public boolean alreadyTransitioned = false;
  public boolean first_time = true;

  public final int space_btn_y = 850;
  public final int game_over_y = 700;

  public void _update() {
    if (v.roundNum != v.roundMax) { alreadyTransitioned = false; v.transitioning = false; return; }

    if (first_time) {
      a.win.jump(0);
      first_time = false;
    }

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
    v.transitioning = true;
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
        first_time = true;

        v.roundNum = 1;
        v.game++;

        transitionIn.reset();
        transitionOut.reset();

      }
    }

    if (transitionIn.done && !transOut) {
      fill(255);
      drawGames();

      if (v.game >= v.games_max) {
        drawGameOver();
      } else {
        drawSpaceBtn();
      }

      v.totalCorrect = 0;
      v.currStreak = 0;
      v.highestStreak = 0;
      v.score = 0;

      v.transitioning = false;
    }
  }

  private void drawGames() {
    textSize(32);
    // White text
    for(int i =0; i<v.game; i++) {
      Game g = v.games[i];

      String space = "    ";
      // ! Rico asks that they are called rounds
      // Though interally the rounds are called games
      // because the variable name round is allready used
      String s = "Round : " + (i+1) +
        space + "Score: " + g.score +
        space + "Correct: " + g.totalCorrect +
        space + "Highest Streak: " + g.highestStreak;

      textAlign(CENTER);
      int y = start_games_y + i * 50;
      text(s, v.cw, y);
    }
  }

  private void drawSpaceBtn() {
    // TODO: Draw the space btn
    image(a.space, v.cw, space_btn_y);
    textSize(20);
    text("Press space to continue!", v.cw, space_btn_y + 100);
  }

  private void drawGameOver() {
    textSize(50);
    text("Thanks for playing!", v.cw, game_over_y);
  }

  public void keyPressed() {
    // If the spacebar is pressed when the transitionIn is done begin to transiton out
    // and the game is not over
    if (!(v.game >= v.games_max )&& v.roundNum == v.roundMax && transitionIn.done && key == ' ') {
      transOut = true;
    }
  }

  public GameTrans(Assets a, Variables v) { super(a, v); }
}
