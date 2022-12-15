import 'package:pit02gp07/src/model/user_model.dart';

abstract class HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateEmpty extends HomeState {}

class HomeStateSuccess extends HomeState {
  final UserData user;

  HomeStateSuccess({
    required this.user,
  });
}

class HomeStateError extends HomeState {}
