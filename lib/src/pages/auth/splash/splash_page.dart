import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'package:pit02gp07/src/pages/auth/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashController controller;
  @override
  void initState() {
    controller = SplashController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.iceWhite,
      child: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Image.asset('assets/images/bank.png'),
        ),
      ),
    );

  }
}
