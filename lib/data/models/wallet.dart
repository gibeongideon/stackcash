import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Wallet extends Equatable {
  const Wallet({@required this.id, @required this.amount, @required this.nowbal,@required this.transtype});

  final int id;
  final String amount;
  final String nowbal;
  final String transtype;

  @override
  List<Object> get props => [id, amount, nowbal,transtype];
}


  //  {
  //       "id": 1,
  //       "amount": "4001.00",
  //       "trans_type": "Deposit to Account"
  //   }


  