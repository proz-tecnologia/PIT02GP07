import 'package:flutter/material.dart';

class CreditCardScreen extends StatelessWidget {
  const CreditCardScreen({
    super.key,
  });

  static const BottomNavigationBarItem item = BottomNavigationBarItem(
    icon: Icon(Icons.credit_card_outlined),
    label: 'Cartões',
    tooltip: 'Ir para Cartões',
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
