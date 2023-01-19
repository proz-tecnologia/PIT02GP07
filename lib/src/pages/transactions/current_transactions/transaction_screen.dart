// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pit02gp07/src/pages/home/components/financial_operation.dart';
import 'package:pit02gp07/src/pages/home/state/home_state.dart';
import 'package:pit02gp07/src/shared/widgets/value_widget.dart';
import 'package:pit02gp07/src/pages/transactions/current_transactions/controller/transaction_controller.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../model/expenses_model.dart';
import 'components/transaction_resume_card.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.state.transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            endActionPane:
                ActionPane(motion: const ScrollMotion(), extentRatio: 0.25,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                  InkWell(
                    child: Icon(Icons.edit),
                    onTap: () {},
                  ),
                  InkWell(child: Icon(Icons.delete), onTap: () {})
                ]),
            child: FinanceOperationWidget(
                transaction: widget.state.transactions[index]),
          );
        },
      ),
    );
  }
}
