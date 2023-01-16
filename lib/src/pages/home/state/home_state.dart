import 'package:pit02gp07/src/model/transaction_model.dart';
import 'package:pit02gp07/src/model/user_model.dart';

abstract class HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateEmpty extends HomeState {}

class HomeStateSuccess extends HomeState {
  final UserData user;
  final List<TransactionModel> transactions;

  HomeStateSuccess({
    required this.user,
    required this.transactions
  });
}

class HomeStateError extends HomeState {}
