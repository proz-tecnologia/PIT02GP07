import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_style.dart';

class ValueWidget extends StatelessWidget {
  const ValueWidget({
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
