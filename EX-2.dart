class BankAccount {
    // TODO
    final String _accName;
    final int _accId;
    double _balance;

    BankAccount({required this._accName, required this._accId, this._balance = 0});

    double get balance => _balance;

    String get accName => _accName;
    int get accId => _accId;

    double withdraw({required double amount}){
      
      if(amount <= _balance){
        _balance -= amount;
        return _balance;
      }else{
        throw Exception("Insufficient balance for withdrawal!");
      }

    
    }

    void credit({required double amount}){
      _balance += amount;
    }


}

class Bank {
    // TODO
    final String bankName;

    final String _bankId;

    final List<BankAccount> _bankAccounts = [];


    Bank({required this.bankName, required this._bankId});

    String get bankID => _bankId;

    BankAccount createAccount({required int accountId, required String accountOwner}){
      for(var account in _bankAccounts){
        if(accountId == account.accId){
          throw Exception(" Account with ID ${accountId} already exists!");
        }
      }
      BankAccount newAccount = BankAccount(accName: accountOwner, accId: accountId);
      _bankAccounts.add(newAccount);
      return newAccount;
    }
}
 
void main() {


  Bank myBank = Bank(bankName:"CADT Bank", bankId: "ABA1");
  BankAccount ronanAccount = myBank.createAccount(accountId: 100, accountOwner: "Ronamn");

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(amount: 100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(amount: 50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(amount: 75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(accountId: 100, accountOwner: "Hongly"); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }

}
