import 'package:flutter/material.dart';

import '../../../core/theme/app_text_style.dart';

class HomeScreenCardWidget extends StatelessWidget {
  final String title;
  final Widget card;

  const HomeScreenCardWidget({
    Key? key,
    required this.card,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Text(
            title,
            style: AppTextStyle.largeWhite,
          ),
        ),
        card,
      ],
    );
  }
}
