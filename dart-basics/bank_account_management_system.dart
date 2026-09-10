class BankAccount {
  String? accountNumber;
  String? accountHolderName;
  double? balance;

  BankAccount(this.accountNumber, this.accountHolderName, this.balance);


  int deposite(int amount) {
    if (amount <= 0) {
      print('Deposit amount must be greater than zero.');
      return -1;
    }
    balance = (balance ?? 0) + amount;
    print('Deposited: \$${amount}. New balance: \$${balance}.');
    return 0;
  }
}