/**
 * Generates a random test whitch has a minimum of 10 questions
 */
public class Test {
  public int numQuestions = 0;
  public int numCorrect = 0;
  public double percentCor = 0.0;
  public Question[] questions;
  public int curQues = 0;

  // * Constants for drawing the UI
  private final int topHeight = 100;
  private final color topBg = #1e293b;
  private final int topSafe = 10;

  public Test(int q) {
    numQuestions = q;
    questions = new Question[q];
    for(int i = 0; i < q; i++) {
      questions[i] = new Question();
    }
  }

  public void _setup() {
    for(Question u : questions) {
      println(u);
    }
  }

  public void _draw() {
    drawTop();
    drawQuestion();
    drawNext();
  }

  private void drawTop() {
    push();

    fill(topBg);
    rect(0, 0, width, 100);

    fill(255);
    textSize(25);
    textAlign(LEFT, TOP);
    text("Q# " + (curQues + 1) + " / 10", topSafe, topSafe);

    textAlign(RIGHT, TOP);
    text("#Correct " + (numCorrect) + " / 10", width-topSafe, topSafe);

    pop();
  }

  private void drawQuestion() {

  }

  private void drawNext() {

  }
}
