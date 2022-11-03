public class Mazes {
  public Maze easy = new Maze(
    new int[][] {
    	{0, 1, 0, 0, 0, 0} , // Maze
    	{0, 1, 0, 0, 0, 0} ,
    	{0, 1, 0, 0, 0, 0} ,
    	{0, 1, 0, 0, 0, 0} ,
    	{0, 1, 1, 1, 1, 0} ,
    	{0, 1, 0, 0, 0, 0}
  } ,
  new Square(5,1, "S"), // Start location
    new Square(0, 1, "E"),// End location
    new Square[] {new Square(4, 4, false)}
   );

  public Maze normal = new Maze(
    new int[][] {
    {0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0} , // Maze
    {0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0} ,
    {0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0} ,
    {0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0} ,
    {0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0} ,
    {0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0} ,
    {0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0} ,
    {0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0} ,
    {0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0} ,
    {0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0}
  } ,
  new Square(0, 1, "S"), // Start location
    new Square(0, 6, "E"), // End location
    new Square[] {
      new Square(1, 6, false)
    }
   );

  public Maze[] mazes;
  public Maze maze;
  // Current maze loaded in the maze arr
  public int cur = 0;
  // Max level of the mazes
  public int max;

  public Mazes() {
    mazes = new Maze[] { normal };

    max = mazes.length - 1;

    maze = mazes[cur];
  }

  public boolean next() {
    if (cur + 1 >= max) return false;

    cur++;
    maze = mazes[cur];

    return true;
  }

  public void update() {
    if (maze == null) return;

    maze.update();
  }

  public void keyPressed() {
    maze.keyPressed();
  }
}
