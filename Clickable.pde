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

  public boolean clicked = false;

  protected void postSetup() {
    updateCorners();
  }

  protected void preUpdate() {
    push();

    if (canMove) {
      updateCorners();
    }

    // Check if the obj was clicked
    if (mousePressed) {
      checkClick();
    }
  }

  private void checkClick() {
    if (!shouldClick()) return;

    if (mouseX >= left && mouseX <= right && mouseY >= bottom && mouseY <= top) {
      clicked = true;
    } else {
      clicked = false;
    }
  }

  protected void updateCorners() {
    left = x - w / 2;
    bottom = y - h / 2;

    right = x + w;
    top = y + w;
  }


  protected boolean shouldClick() {
    return v.transitioning;
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
