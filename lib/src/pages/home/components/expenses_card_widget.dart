import 'package:flutter/material.dart';

import '../../../core/theme/app_text_style.dart';
import '../../widgets/value_widget.dart';

class ExpensesCardWidget extends StatelessWidget {
  final String category;
  final String value;
  const ExpensesCardWidget({
    Key? key,
    required this.category,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: AppTextStyle.mediumWhite,
          ),
          ValueWidget(
            value: value,
          ),
        ],
      ),
    );
  }
}
