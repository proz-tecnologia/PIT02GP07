import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pit02gp07/src/pages/auth/splash/controller/splash_controller.dart';

import 'package:pit02gp07/src/pages/auth/splash/state/splash_state.dart';
import '../../../core/theme/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        bloc: Modular.get<SplashBloc>()..setup(),
        listener: (context, state) {
          if (state is SplashStateLogged) {
            Modular.to.pushReplacementNamed('/home/');
          } else if (state is SplashStateNotLogged) {
            Modular.to.pushReplacementNamed('/login/');
          }
        },
        child: Container(
          color: AppColors.iceWhite,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Image.asset('assets/images/bank.png'),
          ),
        ),
      ),
    );
  }
}
