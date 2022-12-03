import 'package:flutter/material.dart';

import '../../model/expenses_model.dart';
import 'transaction_card.dart';
import 'transaction_resume_card.dart';

class TransactionsScreen extends StatefulWidget {
  final String revenueValue;
  final String expenseValue;

  final int entryListLength;
  final List<ExpenseModel> entrylist;

  const TransactionsScreen({
    Key? key,
    required this.revenueValue,
    required this.expenseValue,
    required this.entryListLength,
    required this.entrylist,
  }) : super(key: key);

  static const BottomNavigationBarItem item = BottomNavigationBarItem(
    icon: Icon(Icons.compare_arrows_outlined),
    label: 'Transações',
    tooltip: 'Ir para Transações',
  );

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 8.0,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: TransactionResumeCard(
                revenueValue: widget.revenueValue,
                expenseValue: widget.expenseValue,
              ),
            ),
          ),
          ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return const TransactionCard(
                category: '',
                value: '',
              );
            },
          ),
        ],
      ),
    );
  }
}
