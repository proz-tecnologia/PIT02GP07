import 'package:flutter/material.dart';

import 'model_wallet_balance.dart';

class ModelWalletType extends StatelessWidget {
  final IconData icon;
  final Color colorIcon;
  final Color backgroundColor;
  final String value;
  final String type;
  final TextStyle style;
  final MainAxisAlignment alignment;

  const ModelWalletType({
    Key? key,
    required this.icon,
    required this.colorIcon,
    required this.backgroundColor,
    required this.value,
    required this.type,
    required this.style,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Icon(
            icon,
            size: 40,
            color: colorIcon,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
          ),
          child: ModelWalletBalance(
            value: value,
            type: type,
            style: style,
            alignment: alignment,
          ),
        ),
      ],
    );
  }
}