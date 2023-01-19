import 'package:flutter/material.dart';
import 'package:pit02gp07/src/pages/home/components/financial_operation.dart';
import 'package:pit02gp07/src/pages/home/state/home_state.dart';
import 'package:pit02gp07/src/shared/utils/formatters.dart';

import '../../../core/theme/app_colors.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({
    Key? key,
    required this.state,
  }) : super(key: key);

  final HomeStateSuccess state;

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ' Seu saldo é ${Formatters.formatToReal(widget.state.user.balance)}',
          style: TextStyle(color: AppColors.iceWhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.state.transactions.length,
          itemBuilder: (BuildContext context, int index) {
            return FinanceOperationWidget(
                transaction: widget.state.transactions[index]);
          },
        ),
      ),
    );
  }
}
