import 'package:mocktail/mocktail.dart';
import 'package:pit02gp07/src/pages/home/controller/home_cubit.dart';
import 'package:pit02gp07/src/pages/home/repository/home_repository.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

class HomeCubitMock extends Mock implements HomeCubit {}