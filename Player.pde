public class Player {
  public int x;
  public int y;
  private Maze maze;
  public boolean alive = true;
  public boolean won = false;
  public boolean moved = false;
  public boolean canMove = true;

  public Player(int x, int y, Maze m) {
    this.x = x;
    this.y = y;
    this.maze = m;
  }

  public void keyPressed() {
    if (key == CODED && alive && canMove) {
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
    image(
        maze.stor.player,
        (x * Settings.STEP) + Settings.STEP / 2,
        (y * Settings.STEP) + Settings.STEP / 2
     );

    pop();
  }
}
