import '../../../model/user_model.dart';

abstract class HomeRepository {
  Future<UserData> getUserData({required String userId});
}
