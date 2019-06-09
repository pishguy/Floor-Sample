import 'package:flutter_floor_sample/app_database.dart';
import 'package:flutter_floor_sample/user_dao.dart';

class MyDatabase {
  AppDatabase db;
  UserDao userDao;

  Future<void> initialDatabase() async {
    db = await $FloorAppDatabase.databaseBuilder('flutter_database.db').build();
  }

  UserDao getUserDao() {
    return db.userDao;
  }
}
