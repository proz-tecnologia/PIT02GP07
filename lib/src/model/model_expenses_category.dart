import 'package:flutter/material.dart';
import '../shared/constants/app_text_style.dart';

class ModelExpensesCategory extends StatelessWidget {
  final String category;
  final String value;
  const ModelExpensesCategory({
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
          Row(
            children: [
              const Text(
                'R\$: ',
                style: AppTextStyle.f14r,
              ),
              Text(
                value,
                style: AppTextStyle.mediumRed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
