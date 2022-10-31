import 'package:flutter/material.dart';
import '../../../../../model/model_expenses_by_category.dart';

class ExpensesCard extends StatelessWidget {
  const ExpensesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            ModelExpensesByCategory(
              category: 'Alimentação',
              value: '16,07',
            ),
            ModelExpensesByCategory(
              category: 'Educação',
              value: '11,45',
            ),
            ModelExpensesByCategory(
              category: 'Vestuário',
              value: '4,74',
            ),
            ModelExpensesByCategory(
              category: 'Outros...',
              value: '  1,26',
            ),
          ],
        ),
      ),
    );
  }
}
