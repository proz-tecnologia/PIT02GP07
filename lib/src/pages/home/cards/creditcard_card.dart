import 'package:flutter/material.dart';

import '../../components/creditcard_card_widget.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
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
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: CreditCardWidget(
          nameCard: 'Cartão itaú',
          date: '18',
          value: '1,29',
        ),
      ),
    );
  }
}
