public abstract class Btn extends Obj {
  protected final int btn_safe = 10;

  protected int x = 500;
  protected int y = 500;

  int left;
  int right;

  int top;
  int bottom;

  protected int w = 150;
  protected int h = 75;
  protected String txt = "Click me!";
  protected int txt_size = 30;
  protected color c = #fac83c;
  protected color txt_c = 0;
  protected int radius = 25;

  protected boolean hasIcon = true;
  protected PShape icon;
  protected int icon_space = 45;
  protected int icon_size = 50;

  protected int icon_x;
  protected int icon_y;

  protected int icon_y_mod = 0;

  protected int txt_space = 10;

  public boolean clicked = false;

  public Btn(Snap app) { super(app); }

  public void setup(){
    _setup();

    setupCorners();
    setupIcon();
  }

  /**
   * Should be overriden by inheriting classes if needed
   * Icon should be setup here
  */
  public void _setup() {

  }


  protected void _update() {
    rectMode(CENTER);
    shapeMode(CENTER);

    fill(c);

    noStroke();
    rect(x, y, w, h, radius, radius, radius, radius);

    // Draw text
    textAlign(CENTER, CENTER);
    fill(txt_c);
    textSize(txt_size);
    text(txt, x + txt_space, y - 3);

    if (hasIcon) {
      shapeMode(CENTER);
      shape(icon, icon_x, icon_y, icon_size, icon_size);
    }

    clicked = false;
  }

  protected void updateVariables() {
    // Does nothing
  }

  public void mousePressed() {
    // Ignore mouse clickes when the game is transitioning!
    if (v.transitioning) return;

    if (mouseX >= left && mouseX <= right && mouseY >= bottom && mouseY <= top) {
      clicked = true;
    } else {
      clicked = false;
    }
  }

  protected void setupCorners() {
    left = x - w / 2;
    bottom = y - h / 2;

    right = x + w;
    top = y + w;
  }

  /**
   * Updates the x and y variables by converting them from corner values to
   * their corresponding center values
  */
  protected void cornerToCenter() {
    x += w / 2;
    y -= h / 2;
  }

  protected void setupIcon() {
    icon_x = x - icon_space;
    icon_y = y + icon_y_mod;
  }
}
