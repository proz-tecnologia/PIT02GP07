import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pit02gp07/src/pages/home/controller/home_cubit.dart';

import '../../../../model/transaction_model.dart';
import '../../../../model/user_model.dart';
import '../../../home/repository/home_repository.dart';
import '../state/add_transaction_state.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  final HomeRepository repository;
  final String userId;
  final UserData userData;

  AddTransactionCubit(
    this.repository,
    this.userId,
    this.userData,
  ) : super(AddTransactionStateEmpty());

  Future<void> addTransaction({
    required TransactionModel transaction,
  }) async {
    try {
      emit(AddTransactionStateLoading());

      UserData? myUserData;

      final updateTransaction = transaction.copyWith(userId: userId);

      await repository.addTransaction(transaction: updateTransaction);
      if (transaction.type == TransactionType.expense) {
        myUserData = userData.copyWith(
          balance: userData.balance - transaction.value,
        );
      } else {
        myUserData = userData.copyWith(
          balance: userData.balance + transaction.value,
        );
      }

      Modular.get<HomeCubit>().userData = myUserData;
      await repository.updateBalance(userData: myUserData);

      emit(AddTransactionStateSuccess());
    } catch (e) {
      emit(AddTransactionStateError(exception: e as Exception));
    }
  }



  Future<void> addCategory({
    required String category,
  }) async {
    try {
      emit(AddTransactionStateLoading());

      await repository.addCategory(category: category, userId: userData.userId);

      emit(AddTransactionStateSuccess());
    } catch (e) {
      emit(AddTransactionStateError(exception: e as Exception));
    }
  }
}
