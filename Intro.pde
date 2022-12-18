// public class Intro extends Obj {
//   public boolean show = true;
//   public boolean trans = false;
//   public boolean done = false;


//   public void _update() {
//     if (!show) {
//       if (trans) { transition(); }

//       return;
//     }

//     imageMode(CORNERS);
//     image(a.intro, 0, 0, m.w, m.h);

//     if (trans) { transition(); }
//   }

//   private void transition() {
//     if (!m.transIn.done) {
//         m.transIn.update();

//         if (m.transIn.opacity > 255) {
//           show = false;
//         }
//       }
//     else {
//       if (!m.transOut.done) {
//         m.transOut.update();
//       }
//     }

//     if (m.transIn.done && m.transOut.done) {
//       trans = false;
//       done = true;
//       m.transIn.reset();
//       m.transOut.reset();
//     }
//   }

//   public void keyPressed() {
//     if (!done && keyCode == ENTER) {
//       trans = true;
//     }
//   }

//   public Intro(Snap app) { super(app); }
// }
