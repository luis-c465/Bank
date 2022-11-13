/**
 * Generates a random question of addition of subtraction of two numbers in the range [0,9]
 *
 * Questions should also have a word problem representation
 */
public class Question {
  public boolean addition;
  public int num1 = -1;
  public int num2 = -1;
  public int answer;
  public String sAnswer;

  public Question() {
    addition = rand();
    num1 = (int) random(10);
    if (addition) {
      num2 = (int) random(10);
      answer = num1 + num2;
    } else {
      // ! Makes sure that num1 - num2 is >= 0
      num2 = Integer.MAX_VALUE;
      while(num1 - num2 < 0) {
        num2 = (int) random(10);
      }

      answer = num1 - num2;
    }

    sAnswer = "" + answer;
  }

  public boolean rand() {
    int n = -1 + (int)random(2) * 2;
    return n == 1;
  }

  public String toString() {
    return "" + num1 + (addition ? " + ": " - ") + num2 + " = " + answer;
  }
}
