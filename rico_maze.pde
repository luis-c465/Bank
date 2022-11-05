import processing.sound.*;

ImageStor stor = new ImageStor();
PFont mono;

Maze lvl1 = new Maze(
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
  new Square[] {new Square(4, 4, false)},
  new Square(4, 1),
  stor
);

Maze lvl2 = new Maze(
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
  },
  new Square(5, 3),
  stor
);

Maze lvl3 = new Maze(
  new int[][] {
    {0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, },
    {0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
    {0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
    {0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, },
    {0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
    {0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
    {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
    {0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
    {0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, },
    {0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
    {0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, },
    {0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, },
    {0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, },
    {0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, },
    {0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, },
    {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
    {1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
    {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, },
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, },
  },
  new Square(0, 3, "S"), // Start location
  new Square(19, 19, "E"), // End location
  new Square[] {
    new Square(19, 6, false),
    new Square(5, 10, false),
    new Square(10, 18, false)
  },
  new Square(4, 1),
  stor
);

Maze lvl4 = new Maze(
  new int[][] {
    {0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, },
    {0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, },
    {0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, },
    {0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, },
    {0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, },
    {0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, },
    {0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, },
    {0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, },
    {0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, },
    {0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, },
    {0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, },
    {0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, },
    {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, },
  },
  new Square(20, 20, "S"), // Start location
  new Square(0, 1, "E"), // End location
  new Square[] {
    new Square(19, 4, false),
    new Square(6, 10, false),
    new Square(10, 18, false)
  },
  new Square(4, 1),
  stor
);

Maze lvl5 = new Maze(
  new int[][] {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, },
    {0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, },
    {0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, },
    {0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, },
    {0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, },
    {0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, },
    {0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, },
    {0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, },
    {0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, },
    {0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, },
    {0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, },
    {0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, },
    {0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, },
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
  },
  new Square(12, 17, "S"), // Start location
  new Square(5, 9, "E"), // End location
  new Square[] {
    new Square(4, 17, false),
    new Square(16, 3, false),
    new Square(16, 12, false)
  },
  new Square(4, 1),
  stor
);


SoundFile stab;
TransitionIn transitionIn;
TransitionOut transitionOut;

int curMazeNum = 0;
// Maze[] mazes = { easy, normal, lvl3 };
Maze[] mazes = { lvl1, lvl2, lvl3, lvl4, lvl5 };
Maze maze = mazes[curMazeNum];
boolean didDeath = false;
boolean levelTransition = false;
boolean intro = true;
boolean introTransition = false;

void setup() {
  size(1200, 1200);
  background(255);
  shapeMode(CENTER);
  textAlign(CENTER);

  stab = new SoundFile(this, "stab.mp3", true);

  transitionIn = new TransitionIn();
  transitionOut = new TransitionOut();

  stor.setup();
  mono = createFont("fonts/ThaleahFat.ttf", 64);
  textFont(mono);

  imageMode(CENTER);

  println(maze);
}

void draw() {
  background(255);

  if (intro) {
    drawIntro();
    return;
  } else if (introTransition) {
    introTransition();
  }

  maze.update();

  if (!maze.player.alive) {
    onPlayerDeath();
  }

  if (maze.player.x == maze.end.c && maze.player.y == maze.end.l || levelTransition) {
    levelTransition();
  }
}

void keyPressed() {
  maze.keyPressed();

  if (intro && keyCode == ENTER) {
    intro = false;
    introTransition();
  }

  if (!maze.player.alive && key == ' ') {
    restart();
  }
}

boolean nextMaze() {
  if (curMazeNum +1 >= mazes.length) return false;

  curMazeNum++;
  maze = mazes[curMazeNum];

  return true;
}

void restart() {
  curMazeNum = 0;
  maze = mazes[curMazeNum];
  stab.cue(0.0);

  for(Maze m : mazes) {
    m.reset();
  }
}

void onPlayerDeath() {
  if (!didDeath) {
    stab.play(0);
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

    stor.playerDead.resize(200, 200);
    image(stor.playerDead, width/2, height/2 + 400);

    pop();
  }
}

void introTransition() {
  maze.player.canMove = false;
  introTransition = true;
  transitionOut.update();

  push();

  textSize(255);
  fill(255);
  text("Level " + (curMazeNum + 1), width / 2, height/2);

  pop();


  if (transitionOut.done) {
    transitionOut.reset();

    introTransition = false;
    maze.player.canMove = true;
  }
}

void levelTransition() {
  maze.player.canMove = false;
  levelTransition = true;
  transitionIn.update();

  push();

  textSize(255);
  fill(255);
  text("Level " + (curMazeNum + 1), width / 2, height/2);

  pop();

  if (transitionIn.done) {
    if (transitionOut.opacity == 255) {
      nextMaze();
    }

    transitionOut.update();
  }

  if (transitionIn.done && transitionOut.done) {
    transitionIn.reset();
    transitionOut.reset();

    levelTransition = false;
    maze.player.canMove = true;
  }
}

void drawIntro() {
  push();

  int cw = width / 2;
  int ch = height / 2;

  // Player image x and y to be draw in the intro
  int x = 300;
  int y = 400;


  // TODO: add buttons for W A S D
  fill(0);
  textSize(64);
  text("Toutorial", cw, 200);

  textSize(32);
  text("Use the arrow keys to move", x, y-100);
  image(
    stor.player,
    x,
    y
  );

  // Draw the buttons to move the player
  image(
    stor.up,
    x,
    y - 40
  );
  image(
    stor.down,
    x,
    y + 40
  );

  image(stor.left, x - 40, y);
  image(stor.right, x + 40, y);

  text("Go here to solve the maze!", width - 400, y - 100);
  fill(0, 0, 255);
  square(width - 400, y, Settings.STEP);

  // Reset the fill color back to black
  fill(0);

  y = 700;
  text("Watch out for the impostors though", x, y);
  textSize(20);
  fill(100);
  text("They will follow you and kill you :(", x, y + 20);

  image(stor.sus, x, y + 100);

  fill(0);
  // Sword part
  textSize(32);
  text("The gun can protect you though", width - x, y);
  textSize(20);
  fill(100);
  text("Though it is a bit fragile", width - x, y + 20);

  image(stor.gun, width-x, y + 100);

  stor.enter.resize(160, 80);

  y = 1000;
  fill(0);
  textSize(52);
  text("Press ", cw - 150, y);
  image(stor.enter, cw, y - 10);
  text("to start the game", cw + 300, y);

  pop();
}
