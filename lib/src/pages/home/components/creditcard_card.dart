import 'package:flutter/material.dart';

import '../../credit_card/components/creditcard_card_widget.dart';

class CreditCard extends StatelessWidget {
  final double expenseInCreditCard;

  const CreditCard({
    Key? key,
    this.expenseInCreditCard= 0.00,
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
        child: CreditCardWidget(
          nameCard: 'Meu Cartão',
          date: '18',
          value: expenseInCreditCard.toStringAsFixed(2),
        ),
      ),
    );
  }
}