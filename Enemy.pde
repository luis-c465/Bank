public class Enemy extends Obj {
  final int str_enemy = 15;
  final color c_enemy = #c51110;
  final int w_enemy = 450;
  int sw_enemy;
  final int sh_enemy = 50;
  int h_enemy = Table.start - sh_enemy;
  int r_enemy = w_enemy / 4;

  final color c_glass = #95cadd;
  int sw_glass;
  int sh_glass = sh_enemy + 60;
  int h_glass = 75;
  int w_glass = 200;
  int r_glass = 25;

  final color c_shine = #fcfff8;
  int sw_shine;
  int sh_shine = sh_glass + str_enemy / 4;
  int w_shine = 75;
  int h_shine = 25;
  int r_shine = r_glass / 2;

  public void setup() {
    sw_enemy = (int) v.cw - (w_enemy / 2);

    sw_glass = (int) v.cw - (w_glass / 2);

    sw_shine = v.cw + 10;
  }

  public void _update() {
    shapeMode(CORNERS);

    stroke(0);
    strokeWeight(str_enemy);
    fill(c_enemy);
    rect(sw_enemy, sh_enemy, w_enemy, h_enemy, r_enemy, r_enemy, 0, 0);

    // Draw glass
    fill(c_glass);
    rect(sw_glass, sh_glass, w_glass, h_glass, r_glass, r_glass, r_glass, r_glass);

    // Draw shine
    noStroke();
    fill(c_shine);
    rect(sw_shine, sh_shine, w_shine, h_shine, r_shine, r_shine, r_shine, r_shine);
  }

  public Enemy(Assets a, Variables v) { super(a, v); }
}
