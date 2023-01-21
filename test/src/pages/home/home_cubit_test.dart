import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pit02gp07/src/pages/home/controller/home_cubit.dart';
import 'package:pit02gp07/src/pages/home/state/home_state.dart';

import 'home_cubit.mock.dart';
import 'home_cubit_fixtures.dart';

void main() {
  final repository = HomeRepositoryMock();
  group('Test HomeCubit', () {
    const userId = '1234';
    final resultMocks = HomeCubitFixture();
    final bloc = HomeCubit(repository: repository, id: userId);

    blocTest(
      'Test HomeCubit when success',
      build: () => bloc,
      setUp: () {
        when(
          () => repository.getUserData(userId: userId),
        ).thenAnswer(
          (_) => Future.value(resultMocks.userData),
        );
        when(
          () => repository.getTransaction(userId),
        ).thenAnswer(
          (_) => Future.value(resultMocks.transactions),
        );
      },
      act: (bloc) async {
        await bloc.getUserData();
      },
      expect: () => [
       HomeStateLoading(),
        HomeStateSuccess(
          transactions: resultMocks.transactions,
          user: resultMocks.userData,
        ),
      ],
    );

    blocTest(
      'Test HomeCubit when throw an error',
      build: () => bloc,
      setUp: () {
        when(
          () => repository.getUserData(userId: userId),
        ).thenThrow(
          (_) => Exception('Erro desconhecido'),
        );
      },
      act: (bloc) async {
        await bloc.getUserData();
      },
      expect: () => [
        HomeStateLoading(),
        HomeStateError()
      ],
    );

  });
}
