public class Account {
  public String name;
  public double amount;
  public String id;
  public boolean frozen = false;

  /**
   * Deposits the amount given into the account
   * REturns if the deposit was succesful
  */
  public boolean deposit(double money) {
    amount += money;
    return true;
  }

  /**
   * Withdraws the amount from the account
   * Returns false if the withdraw was calcled due to not having enoguth money
  */
  public boolean withdraw(double money) {
    if (money > amount) {
      return false;
    }

    amount -= money;
    return true;
  }

  public String toString() {
    return name + " $" + amount + (frozen ? "FROZEN" : "") + " \n id:" + id;
  }

  public Account(String name, double amount, String id) {
    super();
    this.name = name;
    this.amount = amount;
    this.id = id;
  }

  public Account(String name, double amount, String id, boolean frozen) {
    super();
    this.name = name;
    this.amount = amount;
    this.id = id;
    this.frozen = frozen;
  }
}
