// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../../../model/model_card_credit.dart';

class CardCredit extends StatelessWidget {
  const CardCredit({
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
            ModelCardCredit(
              nameCard: 'Cartão itaú',
              date: '18',
              value: '1,29',
            ),
            ModelCardCredit(
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

