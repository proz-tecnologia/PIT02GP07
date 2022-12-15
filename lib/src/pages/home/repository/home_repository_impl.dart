import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pit02gp07/src/pages/home/repository/home_repository.dart';

import '../../../model/user_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<UserData> getUserData({required String userId}) async {
    final response = await FirebaseFirestore.instance
        .collection('users')
        .where('userId', isEqualTo: userId)
        .get();

    final document = response.docs.first.data();

    final userData = UserData.fromMap(document);

    return userData;
  }
}
