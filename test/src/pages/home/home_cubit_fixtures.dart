import 'package:pit02gp07/src/model/transaction_model.dart';
import 'package:pit02gp07/src/model/user_model.dart';

class HomeCubitFixture {
  UserData userData = UserData(
    userId: '1234',
    userName: 'userName',
    balance: 3680.0,
  );

  List<TransactionModel> transactions = [
    TransactionModel(
      type: TransactionType.revenue,
      value: 220.0,
      name: 'name',
      category: 'Transporte',
    ),
    TransactionModel(
      type: TransactionType.revenue,
      value: 320.2,
      name: 'name',
      category: 'Transporte',
    ),
    TransactionModel(
      type: TransactionType.revenue,
      value: 430.3,
      name: 'name',
      category: 'Transporte',
    ),
  ];
}
