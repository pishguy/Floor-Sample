import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_floor_sample/user.dart';
import 'package:flutter_floor_sample/user_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}