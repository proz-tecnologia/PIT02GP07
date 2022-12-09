import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../home/home_page.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 3, left: 3),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomePage(title: ''),
              ));
        },
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(400, 40)),
            backgroundColor: MaterialStateProperty.all(AppColors.darkGreen),
            foregroundColor: MaterialStateProperty.all(AppColors.iceWhite),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)))),
        child: const Text(
          'CONFIRMAR',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
