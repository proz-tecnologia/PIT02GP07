import 'package:flutter/material.dart';

import 'cards/card_credit_card.dart';
import 'cards/expenses_card.dart';
import 'cards/wallet_card.dart';
import 'components/home_screen_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  static const BottomNavigationBarItem item = BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Inicial',
    tooltip: 'Ir para tela principal',
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        right: 8.0,
        left: 8.0,
      ),
      children: const [
        HomeScreenCardWidget(
          title: 'Carteira',
          card: WalletCard(),
        ),
        HomeScreenCardWidget(
          title: 'Despesas por categoria',
          card: ExpensesCard(),
        ),
        HomeScreenCardWidget(
          title: 'Cartões cadastrados',
          card: CreditCard(),
        ),
      ],
    );
  }
}
