public abstract class Btn extends Clickable {
  protected final int btn_safe = 10;

  protected String txt = "Click me!";
  protected int txt_size = 30;
  protected color c = #fac83c;
  protected color txt_c = 0;
  protected int radius = 25;

  protected boolean hasIcon = true;
  protected PShape icon;
  protected int icon_space = 45;
  protected int icon_size = 50;

  // ! Calculated in setup
  protected int icon_x;
  protected int icon_y;

  protected int icon_y_mod = 0;

  protected int txt_space = 10;

  public Btn(Snap app) { super(app); }

  protected void postSetup(){
    super.postSetup();
    setupIcon();
  }

  /**
   * Should be overriden by inheriting classes if needed
   * Icon should be setup here
  */
  protected void _setup() {

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
  }

  protected void setupIcon() {
    icon_x = x - icon_space;
    icon_y = y + icon_y_mod;
  }
}
