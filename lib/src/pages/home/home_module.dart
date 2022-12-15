import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/app_controller.dart';
import 'package:pit02gp07/src/pages/home/controller/home_controller.dart';
import 'package:pit02gp07/src/pages/home/home_page.dart';
import 'package:pit02gp07/src/pages/home/repository/home_repository.dart';
import 'package:pit02gp07/src/pages/home/repository/home_repository_impl.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<HomeRepository>(
          (i) => HomeRepositoryImpl(),
        ),
        Bind.singleton<HomeController>(
          (i) => HomeController(
              repository: i.get<HomeRepository>(),
              id: i.get<AppController>().user!.uid),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const HomePage(title: ''),
        ),
      ];
}
