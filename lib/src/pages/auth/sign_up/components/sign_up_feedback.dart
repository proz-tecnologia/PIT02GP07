import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class SignUpFeedBack extends StatelessWidget {
  final VoidCallback onPressed;
  final String message;
  final String textButton;
  const SignUpFeedBack({
    Key? key,
    required this.onPressed,
    required this.message,
    required this.textButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(message),
      backgroundColor: AppColors.darkGray,
      elevation: 16.0,
      actions: [
        TextButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.darkGreen),
          ),
          onPressed: onPressed,
          child: Text(
            textButton,
            style: AppTextStyle.mediumWhiteBold,
          ),
        ),
      ],
    );
  }
}