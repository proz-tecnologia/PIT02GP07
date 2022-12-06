// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../cards/creditcard_card.dart';
import '../cards/expenses_card.dart';
import '../cards/wallet_card.dart';
import '../components/home_screen_card_widget.dart';

class HomeScreen extends StatelessWidget {
  final double revenueValue;
  final double expenseValue;
  final double balanceValue;

  const HomeScreen({
    Key? key,
    required this.revenueValue,
    required this.expenseValue,
    required this.balanceValue,
  }) : super(key: key);

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
      children: [
        HomeScreenCardWidget(
          title: 'Carteira',
          card: WalletCard(
            revenueValue: revenueValue,
            expenseValue: expenseValue,
            balanceValue: balanceValue,
          ),
        ),
        const HomeScreenCardWidget(
          title: 'Despesas por categoria',
          card: ExpensesCard(),
        ),
        const HomeScreenCardWidget(
          title: 'Cartões cadastrados',
          card: CreditCard(),
        ),
      ],
    );
  }
}
