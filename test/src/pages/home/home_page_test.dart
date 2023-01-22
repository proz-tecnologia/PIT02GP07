import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:pit02gp07/src/app_module.dart';
import 'package:pit02gp07/src/pages/home/components/home_state_success.dart';
import 'package:pit02gp07/src/pages/home/home_module.dart';
import 'package:pit02gp07/src/pages/home/home_page.dart';
import 'package:pit02gp07/src/pages/home/repository/home_repository.dart';
import 'package:pit02gp07/src/shared/widgets/app_floating_action_button.dart';

import 'home_cubit.mock.dart';
import 'home_cubit_fixtures.dart';

void main() {
  group('Home Page', () {
    const userId = '1234';
    final resultMocks = HomeCubitFixture();
    final repository = HomeRepositoryMock();

    setUp(() {
      initModules([
        AppModule(),
        HomeModule(),
      ], replaceBinds: [
        Bind.instance<HomeRepository>(
          repository,
        ),
      ]);
    });
    when(
      () => repository.getUserData(userId: userId),
    ).thenAnswer(
      (_) => Future.value(resultMocks.userData),
    );
    when(
      () => repository.getTransaction(userId),
    ).thenAnswer(
      (_) => Future.value(
        resultMocks.transactions,
      ),
    );
    testWidgets(
      "when loading",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: HomePage(),
          ),
        );

        await tester.pump();

        expect(find.byType(CustomFloatingActionButton), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsNothing);
        expect(find.byType(HomeStateSuccessWidget), findsNothing);

        
      },
    );
  });
}
