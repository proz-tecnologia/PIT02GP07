import 'package:flutter/material.dart';

import '../../core/theme/app_text_style.dart';

class WalletBalanceWidget extends StatelessWidget {
  final String value;
  final String type;
  final TextStyle style;
  final CrossAxisAlignment columnAlignment;
  final MainAxisAlignment rowAlignment;

  const WalletBalanceWidget({
    Key? key,
    required this.value,
    required this.type,
    required this.style,
    this.columnAlignment = CrossAxisAlignment.center,
    this.rowAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: columnAlignment,
      children: [
        Row(
          mainAxisAlignment: rowAlignment,
          children: [
            const Text(
              'R\$: ',
              style: AppTextStyle.smallWhite,
            ),
            Text(
              value,
              style: style,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: rowAlignment,
          children: [
            Text(
              type,
              style: AppTextStyle.extraSmallWhite,
            ),
          ],
        ),
      ],
    );
  }
}
