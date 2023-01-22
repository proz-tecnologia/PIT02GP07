import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pit02gp07/src/model/user_model.dart';

import '../repository/home_repository.dart';
import '../state/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;
  final String id;
  UserData? userData;

  HomeCubit({
    required this.repository,
    required this.id,
  }) : super(HomeStateEmpty());

  Future<void> getUserData([List<String>? categories]) async {
    try {
      emit(HomeStateLoading());

      userData = await repository.getUserData(userId: id);
      final transactions = await repository.getTransaction(id, categories);

      emit(HomeStateSuccess(
        user: userData!,
        transactions: transactions,
        ),);

    } catch (e) {
      emit(HomeStateError());
    }
  }
}
