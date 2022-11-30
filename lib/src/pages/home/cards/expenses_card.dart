import 'package:flutter/material.dart';

import 'components/expenses_card_widget.dart';


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
            ExpensesCardWidget(
              category: 'Alimentação',
              value: '16,07',
            ),
            ExpensesCardWidget(
              category: 'Educação',
              value: '11,45',
            ),
            ExpensesCardWidget(
              category: 'Vestuário',
              value: '4,74',
            ),
            ExpensesCardWidget(
              category: 'Outros...',
              value: '  1,26',
            ),
          ],
        ),
      ),
    );
  }
}
