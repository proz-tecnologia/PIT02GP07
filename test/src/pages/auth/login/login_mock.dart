import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pit02gp07/src/pages/auth/repository/repository_impl.dart';

class MockAuthRepository extends Mock implements AuthRepositoryImpl {}

class UserMock extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}
