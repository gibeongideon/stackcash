// {
//         "user_stake": 1,
//         "marketinstant": 7,
//         "marketselection": 1,
//         "amount": "500.00",
//         "update_account_on_win_lose": "PENDING"
//     }

class Stake {
  int username;
  int marketinstant;
  int marketselection;
  String amount;
  // String update_account_on_win_lose;

  Stake({this.username,this.marketinstant, this.marketselection,this.amount});

  factory Stake.fromJson(Map<String,dynamic>json){
    return Stake(
      username: json['user_stake'],
      marketinstant: json['marketinstant'],
      marketselection: json['marketselection'],
      amount: json['amount'],
      // update_account_on_win_lose: json['update_account_on_win_lose'],
      
    );
}
}



class Account {
  int user;
  String balance;

  Account({this.user,this.balance});

  factory Account.fromJson(Map<String,dynamic>json){
    return Account(
      user: json['user'],
      balance: json['balance'],
    );
}
}