import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pit02gp07/src/pages/auth/login/controller/login_controller.dart';
import 'package:pit02gp07/src/pages/auth/login/state/login_state.dart';
import 'package:pit02gp07/src/pages/auth/repository/repository.dart';

import 'login_mock.dart';

void main() {
  group('LoginBloc', () {
    AuthRepository repository = MockAuthRepository();

    LoginCubit cubit = LoginCubit(repository: repository);

    final mockUserCredential = MockUserCredential();

    tearDown(() {
      reset(repository);
      registerFallbackValue(MockUser());
    });

    setUp(() {});

    blocTest('Login with success',
        build: () => cubit,
        setUp: () {
          when(
            () => repository.login(
              email: 'email',
              password: 'password',
            ),
          ).thenAnswer(
            (_) async => mockUserCredential,
          );
        },
        act: (bloc) async {
          await bloc.login(email: 'email', password: 'password');
        },
        expect: () {
          expect(
            cubit.state,
            isA<LoginStateSuccess>(),
          );

          expect((cubit.state as LoginStateSuccess).user, isA<MockUser>());
        },
        verify: (bloc) {});
  });
}
