import 'package:flutter/material.dart';

import '../../../home/components/financial_operation.dart';
import '../../../home/state/home_state.dart';

class TransactionStateSuccessWidget extends StatelessWidget {
  const TransactionStateSuccessWidget({
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
      itemCount: state.transactions.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PopupMenuButton(
                  icon: const Icon(Icons.filter_list),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Wrap(
                          children: state.user.categories.map((String e) {
                            return CustomFilterChip(
                              onSelectItem: onSelectItem,
                              category: e,
                              isSelected: selectedCategories.contains(e),
                            );
                          }).toList(),
                        ),
                      )
                    ];
                  }),
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

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({
    Key? key,
    required this.onSelectItem,
    required this.category,
    required this.isSelected,
  }) : super(key: key);

  final Function(String value) onSelectItem;
  final String category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.0,
      width: 120.0,
      child: Padding(
        padding: const EdgeInsets.all(
          4.0,
        ),
        child: InkWell(
          onTap: () => onSelectItem(category),
          child: Chip(
            label: Text(category),
            backgroundColor: isSelected ? Colors.blue : null,
          ),
        ),
      ),
    );
  }
}
