import 'package:flutter/material.dart';

import 'package:pit02gp07/src/pages/home/cards/components/expenses_card_widget.dart';

class TransactionCard extends StatefulWidget {
  final String value;
  final String category;

  const TransactionCard({
    Key? key,
    required this.value,
    required this.category,
  }) : super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 8.0,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(children: [
              ExpensesCardWidget(
                category: widget.category,
                value: widget.value)
            ]),
          ),
        ),
      ],
    );
  }
}
