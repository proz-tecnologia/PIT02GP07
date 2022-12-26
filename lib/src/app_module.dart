import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/app_controller.dart';
import 'package:pit02gp07/src/pages/auth/authentication_module.dart';

import 'pages/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<AppController>(
          (i) => AppController(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: AuthenticationModule(),
        ),
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
      ];
}
