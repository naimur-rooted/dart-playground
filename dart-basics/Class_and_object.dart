class SavingsAccount {
  // Default constructor
  SavingsAccount(this.customerName, this.fund);

  // Named constructor for foreign accounts
  SavingsAccount.foreign({
    required this.customerName,
    required this.fund,
    required this.hasPassport,
  });

  final String customerName;
  int fund;
  final bool hasPassport;

  void displayFund() {
    print("$customerName's fund: $fund");
  }

  void withdrawMoney(int amount) {
    if (amount > fund) {
      print("Not enough funds");
    } else {
      fund -= amount;
      print("Available Balance: $fund");
    }
  }

  void depositMoney(int amount) {
    fund += amount;
    print("Deposited $amount. New Balance: $fund");
  }
}

void main() {
  final nahidAccount = SavingsAccount("Nahid", 5000);
  final bivaAccount = SavingsAccount("Biva", 10000);
  final ruhulAccount = SavingsAccount("Ruhul", 4000);

  // Using the foreign constructor
  final aliceAccount = SavingsAccount.foreign(
    customerName: "Alice",
    fund: 20000,
    hasPassport: true,
  );

  nahidAccount.withdrawMoney(5000);
  aliceAccount.depositMoney(5000);
  aliceAccount.displayFund();
}
