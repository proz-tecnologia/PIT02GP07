import 'package:pit02gp07/src/model/transaction_model.dart';

import '../../../model/user_model.dart';

abstract class HomeRepository {
  Future<UserData> getUserData({
    required String userId,
  });
  Future<List<TransactionModel>> getTransaction({
    required String userId,
    //List<String>? categories,
  });
  Future<void> addTransaction({
    required TransactionModel transaction,
  });
  Future<void> updateBalance({
    required UserData userData,
  });
  // Future<void> addCategory({
  //   required String category,
  //   required String docId,
  // });
}
