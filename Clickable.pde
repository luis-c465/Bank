/**
 * Class for clickable objects
*/
public abstract class Clickable extends Obj {
  protected int x = 500;
  protected int y = 500;

  // * Variables whitch represent the borders of the clickable area
  // * Are computed in the setup method
  protected int left;
  protected int right;
  protected int top;
  protected int bottom;

  // Should be set to true if the object can move around the canvas
  // If true the corners of the object will be recalculated on very re render
  // ! So only set to true if neccessary!
  protected boolean canMove = false;

  protected int w = 150;
  protected int h = 75;

  // If the user has clicked on the button
  // Will only be true on the first update when the user first clicks on the button
  public boolean clicked = false;

  // If the user is currently clicking on the button
  public boolean clicking = false;

  protected void postSetup() {
    updateCorners();
  }

  protected void preUpdate() {
    push();

    if (canMove) {
      updateCorners();
    }

    // Check if the obj was clicked
    checkClick();
  }

  private void checkClick() {
    if (mousePressed && clicking) {
      clicked = false;
      return;
    } else {
      clicking = false;
    }

    if (!shouldClick() || !mousePressed) {
      clicked = false;
      return;
    }

    clicked = mouseX >= left && mouseX <= right && mouseY >= bottom && mouseY <= top;
    clicking = clicked;
  }

  protected void updateCorners() {
    left = x - w / 2;
    bottom = y - h / 2;

    right = x + w;
    top = y + w;
  }


  protected boolean shouldClick() {
    return !m.transitioning;
  }

  /**
   * Updates the x and y variables by converting them from corner values to
   * their corresponding center values
  */
  protected void cornerToCenter() {
    x += w / 2;
    y -= h / 2;
  }

  public Clickable(Snap app) { super(app); }
}
