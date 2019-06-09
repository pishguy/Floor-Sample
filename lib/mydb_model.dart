import 'package:flutter_floor_sample/my_database.dart';
import 'package:flutter_floor_sample/scoped_model.dart';

class MydbModel extends Model {
  MyDatabase myDatabase = MyDatabase();
  Future _doneFuture;

  MydbModel()  {
    _doneFuture= myDatabase.initialDatabase();
  }

  Future get initializationDone => _doneFuture;
}
