public class Intro extends Transitionable {
  PImage[] slides;
  int maxSlide = 3;
  int index = 0;

  ContBtn contBtn;
  BackBtn backBtn;

  protected void _setup() {
    slides = new PImage[] {a.slide1, a.slide2, a.slide3, a.slide4};

    contBtn = new ContBtn(m);
    backBtn = new BackBtn(m);

    contBtn.setup();
    backBtn.setup();
  }

  protected void _update() {
    image(slides[index], m.cw, m.ch);

    contBtn.update();
    backBtn.update();

    if (contBtn.clicked) {
      if (index == maxSlide) {
        trans = true;
      } else if ((index + 1) <= maxSlide) {
        index++;
      }
    } else if (backBtn.clicked && (index - 1) >= 0) {
      index--;
    }
  }

  protected void onTransOutBegin() {
    doingIntro = false;
  }


  // Uses cont
  private class ContBtn extends Btn {
    public static final String cont = "Next";
    public static final String sta = "Start Game";

    protected void _setup() {
      w = 100;
      h = 50;

      x = Snap.w - 10 - w;
      y = Snap.h - 10;

      txt_size = 15;
      icon_size = 20;

      txt = cont;
      icon = a.cont;
      icon_space = 40;
      txt_space = 10;

      cornerToCenter();
    }

    protected void preUpdate() {
      super.preUpdate();

      // Update the txt
      // and maybe the icon
      if (m.intro.index == m.intro.maxSlide) {
        txt = sta;
      } else {
        txt = cont;
      }
    }

    public ContBtn(Snap app) { super(app); }
  }

  // Uses back as an icon
  private class BackBtn extends Btn {
    protected void _setup() {
      w = 100;
      h = 50;

      x = 10;
      y = Snap.h - 10;

      txt_size = 20;
      icon_size = 20;

      txt = "Back";
      icon = a.backS;
      icon_space = 35;
      txt_space = 0;

      cornerToCenter();
    }

    public BackBtn(Snap app) { super(app); }
  }

  public Intro(Snap app) { super(app); }
}
