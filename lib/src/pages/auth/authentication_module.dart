import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/pages/auth/splash/controller/splash_controller.dart';
import '../home/home_page.dart';
import 'login/controller/login_controller.dart';
import 'login/login_page.dart';
import 'password_recovery/controller/recovery__password_cubit.dart';
import 'password_recovery/recovery_password_page.dart';
import 'sign_up/controller/sign_up_controller.dart';
import 'sign_up/sign_up_page.dart';
import 'splash/repository/repository.dart';
import 'splash/repository/repository_impl.dart';
import 'splash/splash_page.dart';

class AuthenticationModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<AuthRepository>((i) => AuthRepositoryImpl()),
        Bind.lazySingleton<SplashBloc>(
            (i) => SplashBloc(repository: i.get<AuthRepository>(),
            ),
          ),
        Bind.lazySingleton<LoginCubit>((i) => LoginCubit(repository: i.get<AuthRepository>(),
        ),),
        Bind.lazySingleton<RecoveryPasswordCubit>(
          (i) => RecoveryPasswordCubit(
            repository: i.get<AuthRepository>(),
          ),
        ),
        Bind.lazySingleton<SignUpCubit>(
          (i) => SignUpCubit(
            repository: i.get<AuthRepository>(),
          ),
        ),
      ];
      @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const SplashPage(),
        ),
        ChildRoute(
          '/home/',
          child: (_, args) => const HomePage(title: '',)
        ),
        ChildRoute(
          '/login/',
          child: (_, args) => const LoginPage(),
        ),
       ChildRoute(
          '/recoveryPassword',
          child: (_, args) => const RecoveryPasswordPage(),
        ), 
        ChildRoute(
          '/signUp',
          child: (_, args) => const SignUpPage(),
        )
      ];
}
