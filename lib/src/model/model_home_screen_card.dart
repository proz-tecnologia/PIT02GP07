import 'package:flutter/material.dart';
import 'package:pit02gp07/src/shared/constants/app_text_style.dart';

class ModelHomeScreenCard extends StatelessWidget {
  final Widget card;
  final String title;
  const ModelHomeScreenCard({
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
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            title,
            style: AppTextStyle.f20w,
          ),
        ),
        card,
      ],
    );
  }
}
