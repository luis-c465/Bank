public class Player {
  public int x;
  public int y;
  private Maze maze;
  public boolean alive = true;
  public boolean won = false;
  public boolean moved = false;

  public Player(int x, int y, Maze m) {
    this.x = x;
    this.y = y;
    this.maze = m;
  }

  public void keyPressed() {
    if (key == CODED && alive) {
      if (keyCode == UP && maze.validPos(x, y - 1)) {
        y--;
        moved = true;
      } else if (keyCode == DOWN && maze.validPos(x, y + 1)) {
        y++;
        moved = true;
      } else if (keyCode == LEFT && maze.validPos(x - 1, y)) {
        x--;
        moved = true;
      } else if (keyCode == RIGHT && maze.validPos(x + 1, y)) {
        x++;
        moved = true;
      }
    }

    if (moved) {
      println("Player: (" + x + ", " + y + ")");
    }
  }

  public void update() {
    push();

    fill(255, 0, 0);
    circle(
        (x * Settings.STEP) + Settings.STEP / 2,
        (y * Settings.STEP) + Settings.STEP / 2,
        Settings.STEP / 2
     );

    Square end = maze.getEnd();
    // If the player is on the winning square!
    if (x == end.l && y == end.c) {
      fill(0, 408, 612);
      textSize(128);
      text("winner", 40, 120);
      noLoop();
    }

    pop();
  }
}
