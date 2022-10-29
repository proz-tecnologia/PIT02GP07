import 'package:flutter/material.dart';
import '../../../../../model/model_expenses_category.dart';

class ExpensesCard extends StatelessWidget {
  const ExpensesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            ModelExpensesCategory(
              category: 'Alimentação',
              value: '16,07',
            ),
            ModelExpensesCategory(
              category: 'Vestuário',
              value: '11,45',
            ),
            ModelExpensesCategory(
              category: 'Outros...',
              value: '  5,90',
            ),
          ],
        ),
      ),
    );
  }
}
