import 'package:equatable/equatable.dart';
import 'package:pit02gp07/src/model/transaction_model.dart';
import 'package:pit02gp07/src/model/user_model.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeStateLoading extends HomeState {}

class HomeStateEmpty extends HomeState {}

class HomeStateSuccess extends HomeState {
  final UserData user;
  final List<TransactionModel> transactions;

  HomeStateSuccess({required this.user, required this.transactions});

  @override
  List<Object?> get props => [user, transactions];
}

class HomeStateError extends HomeState {}
