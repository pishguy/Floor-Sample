import 'package:floor/floor.dart';

@entity
class User {
  @primaryKey
  final int id;
  String name;
  String avatar;
  int  teammate;
  String experience;
  int  age;
  int  gender;
  int  height;
  int  weight;
  String insurance;
  String job;
  @ColumnInfo(name: 'created_at')
  String createdAt;
  @ColumnInfo(name: 'updated_at')
  String updatedAt;
  @ColumnInfo(name: 'api_token')
  String apiToken;

  User(this.id, this.name, this.height, this.age, this.avatar, this.gender, this.experience, this.insurance, this.job, this.teammate, this.weight, this.apiToken, this.createdAt, this.updatedAt);
}
