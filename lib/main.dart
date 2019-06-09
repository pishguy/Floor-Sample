import 'package:flutter/material.dart';
import 'package:flutter_floor_sample/mydb_model.dart';
import 'package:flutter_floor_sample/scoped_model.dart';
import 'package:flutter_floor_sample/user.dart';

main() {
  runApp(MaterialApp(
    title: 'floor sample',
    home: App(),
  ));
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel(
        model: MydbModel(),
        child: ScopedModelDescendant<MydbModel>(
          builder: (context, _, model) => StreamBuilder<User>(
            stream: model.myDatabase.userDao.getUserInfo(),
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return Text('user not found');
              } else {
                return Text('user found');
              }
            },
          ),
        ),
      ),
    );
  }
}
