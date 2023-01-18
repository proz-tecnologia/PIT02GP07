// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


import 'home_screen_card_widget.dart';
import 'creditcard_card.dart';
import 'expenses_card.dart';

class HomeScreen extends StatefulWidget {
  final double revenueValue;
  final double expenseValue;
  final double balanceValue;
  final double expenseInCreditCard;

  const HomeScreen({
    Key? key,
    required this.revenueValue,
    required this.expenseValue,
    required this.balanceValue,
    required this.expenseInCreditCard,
    // required this.widget,
  }) : super(key: key);

  // final HomeStateSuccessWidget widget;

  static const BottomNavigationBarItem item = BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Inicial',
    tooltip: 'Ir para tela principal',
  );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        right: 8.0,
        left: 8.0,
      ),
      children: [
        // HomeScreenCardWidget(
        //     title: 'Carteira',
        //     card: WalletBalanceWidget(
        //       widget: widget,
        //     )),
        const HomeScreenCardWidget(
          title: 'Despesas por categoria',
          card: ExpensesCard(),
        ),
        HomeScreenCardWidget(
          title: 'Despesas no Cartão',
          card: CreditCard(
            expenseInCreditCard: widget.expenseInCreditCard,
          ),
        ),
      ],
    );
  }
}
