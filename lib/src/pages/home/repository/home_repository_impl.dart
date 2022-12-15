import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pit02gp07/src/pages/home/repository/home_repository.dart';

import '../../../model/user_model.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<UserData> Future getUserData({String userId}) async {
   final response = await FirebaseFirestore.instance
   .collection('users')
   .where('userId', isEqualTo: userId)
   .get();

    if(response.docs.isNotEmpty)
   final document = response.docs[0].data();
final userData = UserData.fromMap(document);

return userData;
}

}