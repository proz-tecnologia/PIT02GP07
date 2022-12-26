import 'package:flutter_modular/flutter_modular.dart';
import 'sign_up/sign_up_page.dart';
import 'splash/controller/splash_controller.dart';
import 'login/controller/login_controller.dart';
import 'login/login_page.dart';
import 'password_recovery/controller/recovery__password_cubit.dart';
import 'password_recovery/recovery_password_page.dart';
import 'sign_up/controller/sign_up_controller.dart';
import 'repository/repository.dart';
import 'repository/repository_impl.dart';
import 'splash/splash_page.dart';

class AuthenticationModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<AuthRepository>(
          (i) => AuthRepositoryImpl(),
        ),
        Bind.lazySingleton<SplashBloc>(
          (i) => SplashBloc(
            repository: i.get<AuthRepository>(),
          ),
        ),
        Bind.lazySingleton<LoginCubit>(
          (i) => LoginCubit(
            repository: i.get<AuthRepository>(),
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
          '/login',
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
