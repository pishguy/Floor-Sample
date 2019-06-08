import 'package:flutter_floor_sample/app_database.dart';
import 'package:flutter_floor_sample/user_dao.dart';

class MyDatabase {
  UserDao userDao;

  Future<UserDao> initialDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder('flutter_database.db').build();
    return database.userDao;
  }
}
