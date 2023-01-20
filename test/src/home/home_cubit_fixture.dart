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
      category: 'Vendas',
      id: '12',
    ),
    TransactionModel(
      type: TransactionType.revenue,
      value: 221.0,
      name: 'name',
      category: 'Vendas',
      id: '31',
    ),
    TransactionModel(
      type: TransactionType.revenue,
      value: 222.0,
      name: 'name',
      category: 'Vendas',
    ),
  ];
}