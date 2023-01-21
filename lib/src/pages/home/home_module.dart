import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/app_controller.dart';
import 'package:pit02gp07/src/pages/home/controller/home_cubit.dart';
import 'package:pit02gp07/src/pages/home/home_page.dart';
import 'package:pit02gp07/src/pages/home/repository/home_repository.dart';
import 'package:pit02gp07/src/pages/home/repository/home_repository_impl.dart';
import 'package:pit02gp07/src/pages/transactions/add_transaction/add_transactions.dart';

import '../transactions/add_transaction/controller/add_transaction_controller.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<HomeRepository>(
          (i) => HomeRepositoryImpl(),
        ),
        Bind.singleton<HomeCubit>(
          (i) => HomeCubit(
              repository: i.get<HomeRepository>(),
              id: 'i.get<AppController>().user!.uid)'),
        ),
        Bind.factory<AddTransactionCubit>(
          (i) => AddTransactionCubit(
            i.get<HomeRepository>(),
            'i.get<AppController>().user!.uid',
            i.get<HomeCubit>().userData!,
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const HomePage(),
        ),
        ChildRoute(
          '/add',
          child: (_, args) => AddTransactions(
            transaction: args.data['transaction'],
            type: args.data['type'],
            categories: args.data['categories'],
          ),
        ),
      ];
}
