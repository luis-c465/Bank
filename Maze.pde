import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Maze
{
  private Square[][] grid;
  private Square start;
  private Square end;
  private Square currState;
  public int lMax;
  public int cMax;
  public char[] order = {'N', 'E', 'S', 'W'}; //Shift order in the grid during solving in cardinals
  public Minoutar[] minoutars;
  public Player player;

  /*
  * Constructor with no file
  * lRange: Number of lines in the maze
  * cRange: Number of columns in the maze
  * start: The starting square of the maze
  * end: the ending square of the maze
  */
  public Maze(int[][] maze, Square start, Square end, Square[] minPos) {
    //Set max values
    this.lMax = maze.length;
    this.cMax = maze[0].length;

    //Init grid
    this.grid = new Square[lMax][cMax];
    for (int l = 0; l < lMax; l++) {
      for (int c = 0; c < cMax; c++) {
        this.grid[l][c] = new Square(l,c, maze[l][c] == 0);
      }
    }

    this.assignMazeToGridSquares();

    //Create start and end MazeState objects contaning the start and end squares (stated)
    this.end = end;
    this.start = start;

    this.currState = this.getStart();
    //At this point, the grid is and stay the inital Maze unsolved.

    player = new Player(start.c, start.l, this);

    minoutars = new Minoutar[minPos.length];
    int i = 0;
    for (Square s : minPos) {
      minoutars[i] = new Minoutar(s.c, s.l, this, player);
      i++;
    }
  }

  public void keyPressed() {
    player.keyPressed();
  }

  public void update() {
    draw();

    player.update();

    for (Minoutar m : minoutars) {
      m.update();
    }
  }

  public boolean validPos(int x, int y) {
    return x >= 0 && x < lMax && y >= 0 && y < cMax && !grid[x][y].isWall();
  }

  public Maze(Square[][] grid, Square start, Square end, Square currState, int lMax, int cMax)
    {
    this.grid = grid;
    this.start = start;
    this.end = end;
    this.currState = currState;
    this.lMax = lMax;
    this.cMax = cMax;
  }

  /*
  * Retuns the starting Square
  */
  public Square getStart()
    {
    return start;
  }

  /*
  * Sets the starting Square for the attribute and the grid
  * start: The square to set as starting square
  */
  public void setStart(Square start)
    {
    this.start = start;
    this.grid[start.getLine()][start.getCol()] = start;
  }

  /*
  * Returns the ending Square
  */
  public Square getEnd()
    {
    return end;
  }

  /*
  * Sets the ending Square for the attribute and the grid
  * end: The square to set as ending square
  */
  public void setEnd(Square end)
    {
    this.end = end;
    this.grid[end.getLine()][end.getCol()] = end;
  }

  /*
  * Sets a wall in the maze
  * l: Line position of the wall
  * c: Column position of the wall
  */
  public void setMazeWall(int l, int c)
    {
    this.grid[l][c].setWall();
  }

  public Square getCurrState()
    {
    return this.currState;
  }

  public void setCurrState(Square c)
    {
    this.currState = c;
  }

  public void setNextState(Square c)
    {
    this.grid[this.currState.getLine()][this.currState.getCol()].setAttribute("*");
    this.currState = c;
  }

  public void assignMazeToGridSquares()
    {
    for (int i = 0; i < this.lMax; i++)
      	{
      for (int j = 0; j < this.cMax; j++)
        {
        this.grid[i][j].assignMaze(this);
      }
    }
  }

  /*
  * Initiates the maze
  */
  public void initMaze()
    {
    //Init grid
    this.resetGrid();

    this.currState = this.getStart();
  }

  public void resetGrid()
    {
    for (int i = 0; i < this.lMax; i++)
      	{
      for (int j = 0; j < this.cMax; j++)
        {
        if (this.grid[i][j].getAttribute() == "*")
          this.grid[i][j].setAttribute(" ");
      }
    }
  }

  /*
  * Sets a new shift order
  * newOrder: 4 entries char array, each char (in caps) means a shift direction, for example : ['N', 'S', 'W', 'E'] will shifts North -> South -> West -> East.
  */
  public void setOrder(char[] newOrder) {
    if (newOrder.length == 4) {
      this.order = newOrder;
    }
  }

  /*
  * Resets the default order North -> East -> South -> West (Clockwise)
  */
  public void resetOrder() {
    char[] o = {'N', 'E', 'S', 'W'};
    this.order = o;
  }

  /*
  * Returns the maze grid
  */
  public Square[][] getGrid() {
    return grid;
  }

  public Maze clone() {
    return new Maze(this.grid, this.start, this.end, this.currState, this.lMax, this.cMax);
  }

  public String toString() {
    return this.currState.toString();
  }

  public void draw() {
    push();

    fill(0);
    for (int x = 0; x < lMax; x++) {
      for (int y = 0; y < cMax; y++) {
        Square s = grid[x][y];

        if (s.isWall()) {
          square(x * Settings.STEP, y * Settings.STEP, Settings.STEP);
        }
      }
    }

    // Fill in the start square with the color green
    fill(0, 255, 0);
    square(start.getCol() * Settings.STEP, start.getLine() * Settings.STEP, Settings.STEP);

    fill(0, 0, 255);
    square(end.getCol() * Settings.STEP, end.getLine() * Settings.STEP, Settings.STEP);

    pop();
  }
}
