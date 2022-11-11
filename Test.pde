/**
 * Generates a random test whitch has a minimum of 10 questions
 */
public class Test {
  public int numQuestions = 0;
  public int numCorrect = 0;
  public double percentCor = 0.0;
  public Question[] questions;

  public Test(int q) {
    numQuestions = q;
    questions = new Question[q];
    for(int i = 0; i<q; i++) {
      questions[i] = new Question();
    }
  }
}
