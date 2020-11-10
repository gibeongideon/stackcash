// import 'package:boilerplate/models/post/post.dart';
import 'package:stackcash/data/models/user_transactions/balance.dart';

class BalanceList {
  final List<Balance> trans;

  BalanceList({
    this.trans,
  });

  factory BalanceList.fromJson(List<dynamic> json) {
    List<Balance> trans = List<Balance>();
    trans = json.map((trans) => Balance.fromMap(trans)).toList();

    return BalanceList(
      trans: trans,
    );
  }
}
