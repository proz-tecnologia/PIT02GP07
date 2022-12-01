import 'package:flutter/material.dart';

import 'components/credit_card_widget.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            CreditCarWidget(
              nameCard: 'Cartão itaú',
              date: '18',
              value: '1,29',
            ),
            CreditCarWidget(
              nameCard: 'Cartão nubank',
              date: '23',
              value: '2,37',
            ),
          ],
        ),
      ),
    );
  }
}
