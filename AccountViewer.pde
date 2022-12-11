/**
 * Draws the currently selected
 * And draws buttons so that they can be managed
*/
public class AccountViewer extends Obj {
  public boolean sameId = false;
  public boolean tooManyAccounts = false;
  public boolean invalidBalance = false;

  public static final int img_size = 200;
  public static final int padding = 20;

  public int all_x = Sidebar.w + padding;
  public int name_x = Sidebar.w + img_size + padding;
  public int name_y = padding;

  public static final int gap = 50;
  public int amount_y = img_size + gap;
  public int misc_x = amount_y + gap * 2;

  public int amount_input_x = all_x;
  public int amount_input_y = misc_x + gap;
  public int amount_input_h = 100;
  public int amount_input_w = 300;

  public String amount_warn_txt = "";
  public int amount_warn_y = amount_input_y + amount_input_h + gap;

  // * Account creation input varaibles
  public int name_input_x = name_x + padding;
  public int name_input_w = 1000 - name_x - padding * 2;
  public int name_input_h = gap * 2;

  public int balance_input_x = all_x;
  public int balance_input_y = amount_y + 0;
  public int balance_input_h = gap*2;
  public int balance_input_w = 1000 - all_x - padding;

  public int balance_warn_y = balance_input_y + balance_input_h + gap - 10;
  public int balance_warn_x = balance_input_x + 200;

  public int id_input_x = all_x;
  public int id_input_y = balance_input_y + balance_input_h + gap;
  public int id_input_h = gap*2;
  public int id_input_w = balance_input_w;

  public static final color warn_c = #f87171;
  public int id_warn_y = id_input_y + id_input_h + gap + padding;

  public static final color money_pos = #22c55e;
  public static final color money_neg = #ef4444;
  public static final color frozen_c = #0284c7;

  public static final int btns_start = 700;

  private Textfield amount;

  private WithdrawBtn withdrawBtn;
  private DepositBtn depositBtn;
  private FreezeBtn freezeBtn;
  private DeleteBtn deleteBtn;
  private ConfirmNewAccBtn confirmNewAccBtn;

  private Textfield name;
  private Textfield balance;
  private Textfield id;

  public void _update() {
    // Show the bg
    imageMode(CORNERS);
    image(a.bg, Sidebar.w, 0);

    if (v.newAcc) {
      showAccCreator();
    } else {
      showAcc();
    }
  }

  /**
   * Show the account creator
  */
  private void showAccCreator() {
    checkBtns();

    // Show the default acc image
    imageMode(CORNERS);
    image(a.def, all_x, padding, all_x + 200, padding + 200);

    push();

    textFont(a.nunito_small);
    textSize(20);
    fill(warn_c);
    textAlign(CORNERS);
    if (sameId) {
      text("That user id already exists", id_input_x, id_warn_y);
    }

    if (tooManyAccounts) {
      text("Maximum 9 accounts can be created", id_input_x, id_warn_y + 20);
    }

    if (invalidBalance) {
      text("The input balance is not a number", balance_warn_x, balance_warn_y);
    }

    pop();

    amount.hide();

    name.show();
    balance.show();
    id.show();

    confirmNewAccBtn.update();
  }

  /**
   * Show the currently selected account
   * If the current acc is null does nothing
  */
  private void showAcc() {
    // If there is no currently selected account show nothing
    // TODO: Show something in this case
    if (v.curAcc == null) {
      amount.hide();
      name.hide();
      balance.hide();
      id.hide();
      return;
    }

    amount.show();
    name.hide();
    balance.hide();
    id.hide();
    // Shoe the buttons for withdraw and deposit
    // Show information about the account

    // Show the image

    // Show the text
    fill(255);
    textAlign(LEFT, TOP);
    textFont(a.nunito);

    // * Display the users image
    imageMode(CORNERS);
    image(a.getAsset(v.curAcc), all_x, padding, all_x + 200, padding + 200);

    // * Display the users name
    text(
      v.curAcc.name,
      name_x,
      name_y
    );

    // * Display the users balance
    // with color
    if (v.curAcc.amount > 0) {
      fill(money_pos);
    } else {
      fill(money_neg);
    }

    textFont(a.nunito_large);
    textSize(40);
    text(
      "$" + String.format("%,.2f", v.curAcc.amount),
      all_x,
      amount_y
    );

    push();
    textSize(20);
    fill(warn_c);
    text(amount_warn_txt, all_x, amount_warn_y);
    pop();


    fill(255);

    // * Display the users id
    textFont(a.nunito_small);
    text(
      "Id: " + v.curAcc.id,
      all_x,
      misc_x
    );

    // * Display if the users account is frozen
    if (v.curAcc.frozen) {
      push();
      fill(frozen_c);
      textAlign(RIGHT, TOP);
      textFont(a.nunito_small);
      text("FROZEN", v.w - padding, misc_x);
      pop();
    }

    // Check and update the buttons
    checkBtns();

    withdrawBtn.update();
    depositBtn.update();
    freezeBtn.update();
    deleteBtn.update();
  }

  public void _setup() {
    // * SETUP INPUTS
    amount = v.cp5.addTextfield("input")
      .setPosition(amount_input_x, amount_input_y)
      .setSize(amount_input_w, amount_input_h)
      .setFont(a.nunito_small)
      .setFocus(true)
      .setColor(color(0))
      .setColorForeground(0)
      .setColorBackground(#ffffff)
      .setCaptionLabel("Withdraw/Deposit")
      .setLabelVisible(true)
      .setColorCaptionLabel(#ffffff)
      .hide();
      ;

    // * Account creation input variables
    name = v.cp5.addTextfield("name")
      .setPosition(name_input_x, name_y)
      .setSize(name_input_w, name_input_h)
      .setFont(a.nunito_small)
      .setFocus(true)
      .setColor(color(0))
      .setColorForeground(0)
      .setColorBackground(#ffffff)
      .setCaptionLabel("Account name")
      .setLabelVisible(true)
      .setColorCaptionLabel(#ffffff)
      .hide();
      ;

    balance = v.cp5.addTextfield("balance")
      .setPosition(balance_input_x, balance_input_y)
      .setSize(balance_input_w, balance_input_h)
      .setFont(a.nunito_small)
      .setFocus(true)
      .setColor(color(0))
      .setColorForeground(0)
      .setColorBackground(#ffffff)
      .setCaptionLabel("Balance")
      .setLabelVisible(true)
      .setColorCaptionLabel(#ffffff)
      .hide();
      ;
    id = v.cp5.addTextfield("id")
      .setPosition(id_input_x, id_input_y)
      .setSize(id_input_w, id_input_h)
      .setFont(a.nunito_small)
      .setFocus(true)
      .setColor(color(0))
      .setColorForeground(0)
      .setColorBackground(#ffffff)
      .setCaptionLabel("Id")
      .setLabelVisible(true)
      .setColorCaptionLabel(#ffffff)
      .hide();
      ;

    //  * SETUP BUTTONS
    withdrawBtn = new WithdrawBtn(app);
    withdrawBtn.setup();

    depositBtn = new DepositBtn(app);
    depositBtn.setup();

    freezeBtn = new FreezeBtn(app);
    freezeBtn.setup();

    deleteBtn = new DeleteBtn(app);
    deleteBtn.setup();

    confirmNewAccBtn = new ConfirmNewAccBtn(app);
    confirmNewAccBtn.setup();
  }

  private void checkNewAccBtns() {
    boolean err = false;

    if (confirmNewAccBtn.clicked) {
      // Check that there adding one more account will not make the accounts array list greater than 9
      if ((v.accounts.size() + 1) > 9) {
        tooManyAccounts = true;
        err = true;
      } else {
        tooManyAccounts = false;
      }

      // also check that the account does not have the same id as an account already in the list
      if (accIdAlreadyDone()) {
        sameId = true;
        err = true;
      } else {
        sameId = false;
      }

      // Now check that the input amount is a valid number
      double amo;
      try {
        amo = Double.parseDouble(balance.getText());
      } catch (Exception e) {
        invalidBalance = true;

        return;
      }
      invalidBalance = false;

      if (err) {
        return;
      }

      // The amount input is good so hide the warn txt

      // The new account is valid so add it to the list!
      Account acc = new Account(name.getText(), amo, id.getText());
      v.accounts.add(acc);
    }
  }

  private void checkViewAccBtns() {
    // Prevent crash
    if (v.curAcc == null) return;

    if (freezeBtn.clicked) {
      v.curAcc.frozen = !v.curAcc.frozen;
    }

    if (deleteBtn.clicked) {
      // Delete the account
      v.accounts.remove(v.curAccIndex);
      v.curAcc = null;
    }

    if (!depositBtn.clicked && !withdrawBtn.clicked) {
      return;
    } else if (v.curAcc.frozen) {
      amount_warn_txt = "You cannot deposit/withdraw when the account is frozen";
      return;
    }

    double amo;
    try {
      amo = Double.parseDouble("0" + amount.getText());
    } catch (Exception e) {
      amount_warn_txt = "Not a valid number!";

      return;
    }


    if (depositBtn.clicked) {
      v.curAcc.amount += amo;
      amount.setText("");
      amount_warn_txt = "";
    } else if (withdrawBtn.clicked) {
      if (amo > v.curAcc.amount) {
        amount_warn_txt = "You cannot withdraw an account into the negetive!";
      } else {
        v.curAcc.amount -= amo;
        amount.setText("");
        amount_warn_txt = "";
      }
    }
  }

  // Should be called before updaign the buttons
  private void checkBtns() {
    if (v.newAcc) {
      checkNewAccBtns();
    } else {
      checkViewAccBtns();
    }
  }

  public void mousePressed() {
    depositBtn.mousePressed();
    withdrawBtn.mousePressed();
    freezeBtn.mousePressed();
    deleteBtn.mousePressed();
    confirmNewAccBtn.mousePressed();
  }

  public boolean accIdAlreadyDone() {
    String _id = id.getText();
    for (Account acc: v.accounts) {
      if (acc.id.equals(_id)) {
        return true;
      }
    }

    return false;
  }

  public AccountViewer(BankApp app) { super(app); }
}
