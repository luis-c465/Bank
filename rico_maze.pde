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
TransitionIn transitionIn;

int curMazeNum = 0;
Maze[] mazes = { easy, normal };
Maze maze = mazes[curMazeNum];
boolean didDeath = false;

void setup() {
  size(1000, 1000);
  background(255);
  shapeMode(CENTER);
  textAlign(CENTER);

  stab = new SoundFile(this, "stab.mp3");
  transitionIn = new TransitionIn();

  println(maze);
}

void draw() {
  background(255);

  maze.update();

  if (!maze.player.alive) {
    onPlayerDeath();
  }
}

void keyPressed() {
  maze.keyPressed();

  if (!maze.player.alive && key == ' ') {
    restart();
  }
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

  for(Maze m : mazes) {
    m.reset();
  }
}

void onPlayerDeath() {
  if (!didDeath) {
    stab.play();
    didDeath = true;
  }

  transitionIn.update();

  if (transitionIn.done) {
    push();

    fill(255);
    textSize(100);
    text("You died",width / 2, height/2 - 100);

    textSize(75);
    text("Press <Space> to restart", width/2, height/2 + 100);

    pop();
  }
}
