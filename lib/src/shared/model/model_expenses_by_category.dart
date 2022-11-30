import 'package:flutter/material.dart';
import '../../core/theme/app_text_style.dart';
import 'model_value.dart';

class ModelExpensesByCategory extends StatelessWidget {
  final String category;
  final String value;
  const ModelExpensesByCategory({
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
          ModelValue(value: value),
        ],
      ),
    );
  }
}
