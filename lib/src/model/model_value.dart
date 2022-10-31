import 'package:flutter/material.dart';
import '../shared/constants/app_text_style.dart';

class ModelValue extends StatelessWidget {
  const ModelValue({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'R\$: ',
          style: AppTextStyle.smallRed,
        ),
        Text(
          value,
          style: AppTextStyle.mediumRed,
        ),
      ],
    );
  }
}
