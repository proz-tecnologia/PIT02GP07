

import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/home_repository.dart';
import '../state/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;
  final String id;

  HomeCubit({
    required this.repository,
    required this.id,
  }) : super(HomeStateEmpty());

  Future<void> getUserData() async {
    try {
      emit(HomeStateLoading());

      final userData = await repository.getUserData(userId: id);

      emit(HomeStateSuccess(user: userData));
    // ignore: unused_catch_stack
    } catch (e, s) {
      emit(HomeStateError());
    }
  }
}