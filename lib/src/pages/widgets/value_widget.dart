import 'package:flutter/material.dart';

import '../../core/theme/app_text_style.dart';

class ValueWidget extends StatelessWidget {
  final String value;
  final TextStyle style;

  const ValueWidget({
    Key? key,
    required this.value,
    this.style = AppTextStyle.mediumRed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //todo overflow em "value" com valores altos. ex: 1.000.000,00
      width: 100,
      child: Row(
        children: [
          Text(
            'R\$: ',
            style: style,
          ),
          Text(
            value,
            style: style,
          ),
        ],
      ),
    );
  }
}
