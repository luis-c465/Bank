/**
 * Draws the currently selected
 * And draws buttons so that they can be managed
*/
public class AccountViewer extends Obj {
  public static final int img_size = 200;
  public static final int padding = 20;

  public int all_start = Sidebar.w + padding;
  public int txt_start_x = Sidebar.w + img_size + padding;
  public int misc_start_x = Sidebar.w + padding;

  public int frozen_start_x = misc_start_x + 200;

  public static final int gap = 50;
  public int amount_start = img_size + gap;
  public int misc_start = amount_start + gap * 2;

  public int amount_input_y = misc_start + gap;
  public int amount_input_h = 100;
  public int amount_input_w = 300;

  public static final color money_pos = #22c55e;
  public static final color money_neg = #ef4444;
  public static final color frozen_c = #0284c7;

  private Textfield amount;

  public void _update() {
    // If there is no currently selected account show nothing
    // TODO: Show something in this case
    if (v.curAcc == null) return;

    // Show information about the account

    // Show the image

    // Show the text
    fill(0);
    textAlign(LEFT, TOP);
    textFont(a.nunito);

    text(
      v.curAcc.name,
      txt_start_x,
      padding
    );

    if (v.curAcc.amount > 0) {
      fill(money_pos);
    } else {
      fill(money_neg);
    }

    textFont(a.nunito_large);
    text(
      "$" + String.format("%.2f", v.curAcc.amount),
      misc_start_x,
      amount_start
    );

    fill(0);

    textFont(a.nunito_small);
    text(
      "Id: " + v.curAcc.id,
      misc_start_x,
      misc_start
    );

    if (!v.curAcc.frozen) {
      push();
      fill(frozen_c);
      textAlign(RIGHT, TOP);
      textFont(a.nunito_small);
      text("FROZEN", v.w - padding, misc_start);
      pop();
    }
  }

  public void _setup() {
    // Text input
    amount = v.cp5.addTextfield("input")
      .setPosition(all_start, amount_input_y)
      .setSize(amount_input_w, amount_input_h)
      .setFont(a.nunito_small)
      .setFocus(true)
      .setColor(color(0))
      .setColorForeground(0)
      .setColorBackground(#ffffff)
      .setCaptionLabel("Withdraw/Deposit")
      .setLabelVisible(true)
      .setColorCaptionLabel(#000000)
      .setInputFilter(1)
      ;
  }

  public AccountViewer(BankApp app) { super(app); }
}
