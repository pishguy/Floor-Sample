import 'package:flutter/material.dart';
import 'package:flutter_floor_sample/user.dart';
import 'package:flutter_floor_sample/user_dao.dart';

import 'my_database.dart';

Future<void> main() async {
  MyDatabase myDatabase = MyDatabase();
  final userDao = myDatabase.userDao;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    showSemanticsDebugger: false,
    title: 'floor sample',
    theme: ThemeData(
      primarySwatch: Colors.indigo,
    ),
    home: App(userDao: userDao),
  ));
}

class App extends StatefulWidget {
  final UserDao userDao;

  App({Key key, this.userDao}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  UserDao get _userDao => widget.userDao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User>(
        stream: _userDao.getUserInfo(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return Text('user not found');
          } else {
            return Text('user found');
          }
        },
      ),
    );
  }
}
