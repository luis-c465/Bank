public class Player {
  public int x;
  public int y;
  private Maze maze;
  public boolean alive = true;
  public boolean won = false;

  public Player(int x, int y, Maze m) {
    this.x = x;
    this.y = y;
    this.maze = m;
  }

  public void keyPressed() {
    print(key);

    if (key == CODED) {
      if (keyCode == UP && maze.validPos(x, y - 1)) {
        y--;
      } else if (keyCode == DOWN && maze.validPos(x, y + 1)) {
        y++;
      } else if (keyCode == LEFT && maze.validPos(x - 1, y)) {
        x--;
      } else if (keyCode == RIGHT && maze.validPos(x + 1, y)) {
        x++;
      }
    }

    // if (y < 0)
    //   y = 0;
    // else if (y > height - Settings.STEP)
    //   y = height - Settings.STEP;
    // else if (x < 0)
    //   x = 0;
    // else if (x > width - Settings.STEP)
    //   x = width - Settings.STEP;
  }

  public void update() {
    push();

    fill(255, 0, 0);
    circle(
     (x * Settings.STEP) + Settings.STEP / 2,
     (y * Settings.STEP) + Settings.STEP / 2,
      Settings.STEP / 2
     );

    // int qx = x / Settings.STEP;
    // int qy = y / Settings.STEP;

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
