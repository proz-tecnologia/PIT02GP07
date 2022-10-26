import 'package:flutter/material.dart';

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
    final String text = title;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: card,
        ),
      ],
    );
  }
}