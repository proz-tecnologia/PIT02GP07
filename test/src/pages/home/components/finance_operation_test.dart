import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';
import 'package:pit02gp07/src/core/theme/app_text_style.dart';
import 'package:pit02gp07/src/model/transaction_model.dart';
import 'package:pit02gp07/src/pages/home/components/financial_operation.dart';

void main() {
  testWidgets(
    "Testing FinanceOperationWidget",
    (WidgetTester tester) async {
      final transaction = TransactionModel(
          type: TransactionType.revenue,
          value: 220.0,
          name: 'name',
          category: 'Transporte');
      await tester.pumpWidget(
        MaterialApp(
          home: FinanceOperationWidget(transaction: transaction),
        ),
      );

      final card = tester.widget<Card>(find.byType(Card));
      expect(card.color, AppColors.mediumGray);
      expect(find.text(transaction.name), findsOneWidget);
      expect(
          find.text(
              DateFormat('dd/MM/yyyy').format(transaction.createdAt!.toDate())),
          findsOneWidget);
      expect(
          find.text(
              DateFormat('h:mm a').format(transaction.createdAt!.toDate())),
          findsOneWidget);
      expect(
          find.text(
              'R\$ ${transaction.value.toStringAsFixed(2).replaceFirst('.', ',')}'),
          findsOneWidget);

      expect(
        find.byWidgetPredicate((widget) =>
            widget is Text &&
            widget.data == transaction.name &&
            widget.style == AppTextStyle.mediumWhite),
        findsOneWidget,
      );
    },
  );
}
