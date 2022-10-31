import 'package:flutter/material.dart';

import '../shared/constants/app_colors.dart';
import '../shared/constants/app_text_style.dart';
import 'model_value.dart';

class ModelCardCredit extends StatelessWidget {
  const ModelCardCredit({
    Key? key,
    required this.nameCard,
    required this.date,
    required this.value,
  }) : super(key: key);

  final String nameCard;
  final String date;
  final String value;

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
          Row(
            children: [
              const Icon(
                color: AppColors.iceWhite,
                size: 40.0,
                Icons.credit_card_outlined,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameCard,
                      style: AppTextStyle.mediumWhite,
                    ),
                    Text(
                      'Vencimento dia $date',
                      style: AppTextStyle.smallWhite,
                    ),
                  ],
                ),
              ),
            ],
          ),
          ModelValue(
            value: value,
          ),
        ],
      ),
    );
  }
}
