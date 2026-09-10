void main() {
  // Create BankAccount objects (at least 2)
  BankAccount rahimAccount = BankAccount(
    accountHolderName: 'Rahim',
    accountNumber: '1001',
    initialBalance: 5000,
  );

  BankAccount karimAccount = BankAccount(
    accountHolderName: 'Karim',
    accountNumber: '1002',
    initialBalance: 8000,
  );

  // Display initial account information
  rahimAccount.displayAccountInfo();
  print('');

  // Deposit money into Rahim's account
  rahimAccount.deposit(2000);
  print('After Deposit: Balance: ${rahimAccount.getBalance()}');
  print('');

  // Withdraw money from Rahim's account
  rahimAccount.withdraw(1500);
  print('After Withdrawal: Balance: ${rahimAccount.getBalance()}');
  print('');

  // Display Karim's account information
  karimAccount.displayAccountInfo();
  print('');

  // Demonstrate that a user cannot withdraw more than the available balance
  print('--- Trying to withdraw more than the available balance ---');
  bool withdrawn = rahimAccount.withdraw(99999);
  print('Withdrawal successful? $withdrawn');
  print('Balance is still: ${rahimAccount.getBalance()}');
}

class BankAccount {
  // Properties
  String accountHolderName;
  String accountNumber;
  int _balance; // Private variable (Encapsulation)

  // Constructor
  BankAccount({
    required this.accountHolderName,
    required this.accountNumber,
    required int initialBalance,
  }) : _balance = initialBalance;

  // Getter method for the private balance
  int getBalance() => _balance;

  // Deposit method: adds money to the balance
  void deposit(int amount) {
    if (amount <= 0) {
      print('Deposit amount must be greater than 0.');
      return;
    }
    _balance += amount;
  }

  // Withdraw method: subtracts money from the balance
  // A user cannot withdraw more than the available balance
  bool withdraw(int amount) {
    if (amount <= 0) {
      print('Withdrawal amount must be greater than 0.');
      return false;
    }
    if (amount > _balance) {
      print('Insufficient balance! Cannot withdraw $amount. '
          'Available balance: $_balance');
      return false;
    }
    _balance -= amount;
    return true;
  }

  // Display account information
  void displayAccountInfo() {
    print('Account Holder: $accountHolderName '
        'Account Number: $accountNumber '
        'Balance: $_balance');
  }
}