import 'package:flutter_test/flutter_test.dart';
import 'package:pit02gp07/src/model/user_model.dart';

import '../../fixtures/user_data_fixtures.dart';

void main() {
  group(
    'Testing UserModel',
    () {
      final fixtures = UserDataFixtures();
      test(
        'fromMap when all data provided',
        () {
          final map = fixtures.allData;

          final user = UserData.fromMap(map);

          expect(user.balance, equals(map['balance']));
          expect(user.userId, map['userId']);
          expect(user.userName, map['userName']);
          expect(user.categories, map['categories']);
        },
      );

      test(
        'fromMap when some data is not provided',
        () {
          final map = <String, dynamic>{};

          final user = UserData.fromMap(map);

          expect(user.balance, 0.0);
          expect(user.userId, '');
          expect(user.userName, '');
          expect(user.categories, []);
        },
      );

    },
  );
}