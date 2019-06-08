import 'package:floor/floor.dart';
import 'package:flutter_floor_sample/user.dart';

@dao
abstract class UserDao{
  @Query('SELECT * FROM User LIMIT 1')
  Stream<User> getUserInfo();

  @insert
  Future<void> insertUserInformation(User user);
}