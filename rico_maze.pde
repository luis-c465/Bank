Mazes mazes = new Mazes();

void setup() {
  size(1000, 1000);
  background(255);
  shapeMode(CENTER);
}

void draw() {
  background(255);

  // print("loop!");
  mazes.update();
}

void keyPressed() {
  mazes.keyPressed();
}
