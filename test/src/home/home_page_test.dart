import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:pit02gp07/src/app_module.dart';
import 'package:pit02gp07/src/pages/home/components/financial_operation.dart';
import 'package:pit02gp07/src/pages/home/components/home_state_success.dart';
import 'package:pit02gp07/src/pages/home/components/home_state_success_w_filters.dart';
import 'package:pit02gp07/src/pages/home/controller/home_cubit.dart';
import 'package:pit02gp07/src/pages/home/home_module.dart';
import 'package:pit02gp07/src/pages/home/home_page.dart';
import 'package:pit02gp07/src/pages/home/state/home_state.dart';
import 'package:pit02gp07/src/pages/transactions/current_transactions/components/transaction_state_success.dart';
import 'package:pit02gp07/src/shared/widgets/app_floating_action_button.dart';

import 'home_cubit.mock.dart';
import 'home_cubit_fixture.dart';

void main() {
  group(
    'Home Page',
    () {
      const userId = '1234';
      final fixtures = HomeCubitFixture();

      final cubit = HomeCubitMock();

      setUpAll(() {
        initModules([
          AppModule(),
          HomeModule(),
        ], replaceBinds: [
          Bind.instance<HomeCubit>(
            cubit,
          ),
        ]);
      });

      setUp(() {
        when(cubit.close).thenAnswer(Future.value);
      });

      testWidgets(
        'when loading',
        (WidgetTester tester) async {
          when(cubit.getUserData).thenAnswer(Future.value);

          whenListen<HomeState>(
            cubit,
            Stream<HomeState>.fromIterable([
              HomeStateEmpty(),
              HomeStateLoading(),
            ]),
            initialState: HomeStateEmpty(),
          );

          await tester.pumpWidget(
            const MaterialApp(
              home: HomePage(),
            ),
          );

          await tester.pump(const Duration(milliseconds: 500));

          expect(find.byType(CustomFloatingActionButton), findsOneWidget);
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
          expect(find.byType(HomeStateSuccessWidget), findsNothing);
        },
      );

      testWidgets(
        'when success',
        (WidgetTester tester) async {
          when(cubit.getUserData).thenAnswer(Future.value);

          whenListen<HomeState>(
            cubit,
            Stream.fromIterable([
              HomeStateEmpty(),
              HomeStateLoading(),
              HomeStateSuccess(
                user: fixtures.userData,
                transactions: fixtures.transactions,
              ),
            ]),
            initialState: HomeStateEmpty(),
          );

          late BuildContext generatedContext;

          await tester.pumpWidget(
            MaterialApp(
              home: Builder(
                builder: (context) {
                  generatedContext = context;
                  return const HomePage();
                },
              ),
            ),
          );

          await tester.pump(const Duration(milliseconds: 500));

          expect(find.byType(CustomFilterChip), findsNWidgets(2));
          expect(find.byType(FinanceOperationWidget), findsNWidgets(3));

          expect(
            find.byWidgetPredicate(
              (widget) =>
                  widget is SizedBox &&
                  widget.key ==
                      Key('SPACER_DATE_NAME_${fixtures.transactions.first.id.toString()}') &&
                  widget.height == 8.0,
            ),
            findsOneWidget,
          );

          expect(
            find.byWidgetPredicate((widget) =>
                widget is Text &&
                widget.data == fixtures.transactions.first.name &&
                widget.style == Theme.of(generatedContext).textTheme.headline6),
            findsNWidgets(3),
          );
        },
      );
    },
  );
}
