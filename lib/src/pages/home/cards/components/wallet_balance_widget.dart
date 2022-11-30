import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_style.dart';

class WalletBalanceWidget extends StatelessWidget {
  final String value;
  final String type;
  final TextStyle style;
  final MainAxisAlignment alignment;

  const WalletBalanceWidget({
    Key? key,
    required this.value,
    required this.type,
    required this.style,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: alignment,
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
          mainAxisAlignment: alignment,
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
