import 'package:flutter/material.dart';

class Moviments extends StatelessWidget {
  const Moviments({
    super.key,
  });

  static const BottomNavigationBarItem item = BottomNavigationBarItem(
    icon: Icon(Icons.compare_arrows_outlined),
    label: 'Movimentações',
    tooltip: 'Ir para movimentações',
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
