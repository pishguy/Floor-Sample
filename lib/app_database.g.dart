// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final database = _$AppDatabase();
    database.database = await database.open(name ?? ':memory:', _migrations);
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  UserDao _userDaoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);
      },
      onCreate: (database, _) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER PRIMARY KEY NOT NULL, `name` TEXT, `avatar` TEXT, `teammate` INTEGER, `experience` TEXT, `age` INTEGER, `gender` INTEGER, `height` INTEGER, `weight` INTEGER, `insurance` TEXT, `job` TEXT, `created_at` TEXT, `updated_at` TEXT, `api_token` TEXT)');
      },
    );
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'avatar': item.avatar,
                  'teammate': item.teammate,
                  'experience': item.experience,
                  'age': item.age,
                  'gender': item.gender,
                  'height': item.height,
                  'weight': item.weight,
                  'insurance': item.insurance,
                  'job': item.job,
                  'created_at': item.createdAt,
                  'updated_at': item.updatedAt,
                  'api_token': item.apiToken
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final _userMapper = (Map<String, dynamic> row) => User(
      row['id'] as int,
      row['name'] as String,
      row['avatar'] as int,
      row['teammate'] as int,
      row['experience'] as String,
      row['age'] as int,
      row['gender'] as String,
      row['height'] as String,
      row['weight'] as String,
      row['insurance'] as int,
      row['job'] as int,
      row['created_at'] as String,
      row['updated_at'] as String,
      row['api_token'] as String);

  final InsertionAdapter<User> _userInsertionAdapter;

  @override
  Stream<User> getUserInfo() {
    return _queryAdapter.queryStream('SELECT * FROM User LIMIT 1',
        tableName: 'User', mapper: _userMapper);
  }

  @override
  Future<void> insertUserInformation(User user) async {
    await _userInsertionAdapter.insert(user, sqflite.ConflictAlgorithm.abort);
  }
}
