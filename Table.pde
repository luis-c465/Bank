public class Table extends Obj {
  public final color colur = #3c7496;
  public static final int start = 350;

  public void _update() {
    // Draw the background
    imageMode(CORNERS);
    image(a.bg, -750, -500);

    shapeMode(CORNERS);

    fill(colur);
    noStroke();
    rect(0, start, v.w, v.h);
  }

  public Table(Snap app) { super(app); }
}
