import processing.sound.*;

Maze easy = new Maze(
  new int[][] {
    {0, 1, 0, 0, 0, 0} , // Maze
    {0, 1, 0, 0, 0, 0} ,
    {0, 1, 0, 0, 0, 0} ,
    {0, 1, 0, 0, 0, 0} ,
    {0, 1, 1, 1, 1, 0} ,
    {0, 1, 0, 0, 0, 0}
  },
  new Square(5,1, "S"), // Start location
  new Square(0, 1, "E"),// End location
  new Square[] {new Square(4, 4, false)}
);

Maze normal = new Maze(
  new int[][] {
    {0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0}, // Maze
    {0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0},
    {0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0},
    {0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0},
    {0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0},
    {0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0},
    {0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0}
  },
  new Square(0, 1, "S"), // Start location
  new Square(0, 6, "E"), // End location
  new Square[] {
    new Square(1, 6, false)
  }
);

SoundFile stab;

int curMazeNum = 0;
Maze[] mazes = { easy, normal };
Maze maze = mazes[curMazeNum];
boolean didDeath = false;

void setup() {
  size(1000, 1000);
  background(255);
  shapeMode(CENTER);

  stab = new SoundFile(this, "stab.mp3");

  println(maze);
}

void draw() {
  background(255);

  maze.update();

  if (!maze.player.alive && !didDeath) {
    stab.play();

    didDeath = true;
  }
}

void keyPressed() {
  maze.keyPressed();
}

boolean nextMaze() {
  if (curMazeNum +1 > mazes.length) return false;

  curMazeNum++;
  maze = mazes[curMazeNum];

  return true;
}

void restart() {
  curMazeNum = 0;
  maze = mazes[curMazeNum];
}
