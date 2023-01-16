import 'package:flutter/material.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';

import '../../../shared/utils/formatters.dart';
import 'home_state_success.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomeStateSuccessWidget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.darkGreen,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Olá, seja bem vindo(a),  ${widget.state.user.userName}',
              style: const TextStyle(
                color: AppColors.iceWhite,
              ),
            ),
          const Text(
              '    Seu saldo é',
              style: TextStyle(
                color: AppColors.iceWhite,
              ),
            ),
            Center(
              child: Text(
                Formatters.formatToReal(widget.state.user.balance),
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
