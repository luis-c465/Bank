Mazes mazes = new Mazes();

void setup() {
  size(1000, 1000);
  background(255);
  shapeMode(CENTER);

  println(mazes.maze);
}

void draw() {
  background(255);

  mazes.update();
}

void keyPressed() {
  mazes.keyPressed();
}
