import java.util.*;
public class Minoutar extends AStarSolver {
  public int x;
  public int y;
  public Maze m;
  public boolean alive = true;
  public Square diedAt;

  private int moveCtn = 999;

  private Player player;

  private ArrayList<Square> moves = new ArrayList<Square>(5);
  private static final int REFRESH_MOVES = 5;

  public Minoutar(int x, int y, Maze maze, Player player) {
    super(maze, true);
    this.x = x;
    this.y = y;
    this.player = player;
    this.m = maze;
  }

  public void update() {
    if (!alive) {
      image(
        m.stor.susDead,
        (diedAt.c * Settings.STEP) + Settings.STEP / 2,
        (diedAt.l * Settings.STEP) + Settings.STEP / 2
      );
      return;
    }

    color c = color(0, 0, 255);

    image(
      m.stor.sus,
      (x * Settings.STEP) + Settings.STEP / 2,
      (y * Settings.STEP) + Settings.STEP / 2
    );

    if (player.moved) {
      move();

      if (player.x == x && player.y == y) {
        if (player.gun != null && player.gun.use()) {
          this.alive = false;
          diedAt = new Square(y, x);
          stor.gunS.jump(0);
        } else {
          player.alive = false;
        }
      }
    }
  }

  public void move() {
    if (moveCtn < min(REFRESH_MOVES, moves.size())) {
      Square nextMove = moves.get(moveCtn);

      x = nextMove.getCol();
      y = nextMove.getLine();

      moveCtn++;
    } else {
      try {
        updateMoves();
        moveCtn = 0;
        move();
      } catch(StackOverflowError e) {
          // I am too lazy to fix this issue :(
      }
    }
  }


  public void updateMoves() {
    moves.clear();
    this.maze.initMaze(); //Re-init maze

    Boolean endfound = false;
    this.nodesCounter = 0;
    this.pathLength = 0;

    Square pos = new Square(y, x, false);
    pos.assignMaze(maze);

    if (manhattan) {
      pos.calcManhattanH();
    } else {
      pos.calcEuclidH();
    }

    pos.calcF();

    maze.setCurrState(pos);

    //Init data structures
    this.frontier.clear(); //Clear frontier Queue
    ((PriorityQueue<Node<Maze>>) this.frontier).offer(
        new Node<Maze>(this.maze)
      ); //Adding the first node (Start node) (G is at 0, Start to Start = 0)
    this.closedSquares.clear(); //Clear closedSquares

    //Measure run time
    long startTime = System.currentTimeMillis();

    while (!endfound) {
      if (this.frontier.isEmpty()) break; else {
        Node<Maze> current =
          ((PriorityQueue<Node<Maze>>) this.frontier).remove();
        this.maze = (Maze) current.getContent();
        Square currState = this.maze.getCurrState();

        if (
          currState.getCol() == player.x &&
          currState.getLine() == player.y
        ) {
          Node<Maze> temp = new Node<Maze>(this.maze);
          temp.setFather(current);
          ((PriorityQueue<Node<Maze>>) this.frontier).offer(temp);
          endfound = true;
        } else {
          LinkedList<Node<Maze>> nexts = this.getNextSquares();
          if (!this.closedSquares.contains(currState)) {
            this.closedSquares.add(currState);
            currState.setAttribute("*");
          }

          Iterator<Node<Maze>> x = nexts.iterator();

          while (x.hasNext()) {
            Node<Maze> neighbor = x.next();

            if (
              this.closedSquares.contains(neighbor.getContent().getCurrState())
            ) continue; else {
              if (!this.frontier.contains(neighbor)) {
                neighbor.setFather(current);
                ((PriorityQueue<Node<Maze>>) this.frontier).offer(neighbor);
                this.nodesCounter++;
              }
            }
          }
        }
      }
    }
    long endTime = System.currentTimeMillis();

    long time = endTime - startTime;

    Square state = null;
    if (endfound) {
      this.maze.resetGrid();
      Node<Maze> revertedTree =
        ((PriorityQueue<Node<Maze>>) this.frontier).remove();

      revertedTree = revertedTree.getFather();
      // this.result += "Path: " + this.maze.getEnd().toString() + "(End) <- ";
      this.pathLength++;

      while (revertedTree.hasFather()) {
        Maze temp = revertedTree.getContent();
        state = temp.getCurrState();

        moves.add(state);

        if (!state.equals(this.maze.getEnd())) {
          this.pathLength++;
        }
        revertedTree = revertedTree.getFather();
      }

      Collections.reverse(moves);
      // Limits the moves arraylist to a size of 5
      moves.subList(min(REFRESH_MOVES, moves.size()), moves.size()).clear();
    }
  }
}
