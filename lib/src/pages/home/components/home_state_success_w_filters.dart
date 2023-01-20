import 'package:flutter/material.dart';
import '../state/home_state.dart';
import 'financial_operation.dart';

class HomeStateSuccessWithFiltersWidget extends StatelessWidget {
  const HomeStateSuccessWithFiltersWidget({
    Key? key,
    required this.state,
    required this.selectedCategories,
    required this.onSelectItem,
  }) : super(key: key);

  final HomeStateSuccess state;

  final List<String> selectedCategories;
  final Function(String value) onSelectItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.transactions.length > 3 ? 3 : state.transactions.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FinanceOperationWidget(
                  transaction: state.transactions[index],
                ),
              ),
            ],
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FinanceOperationWidget(
            transaction: state.transactions[index],
          ),
        );
      },
    );
  }
}

