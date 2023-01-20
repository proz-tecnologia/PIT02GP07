import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
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
              PopupMenuButton(
                  icon: const Icon(Icons.filter_list),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Wrap(
                          children: state.user.categories.map((String e) {
                            return SizedBox(
                              height: 36.0,
                              width: 120.0,
                              child: InkWell(
                                onTap: () => onSelectItem(e),
                                child: Chip(
                                  label: Text(e),
                                  backgroundColor:
                                      selectedCategories.contains(e)
                                          ? AppColors.darkGold
                                          : null,
                                ),
                              ),
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
