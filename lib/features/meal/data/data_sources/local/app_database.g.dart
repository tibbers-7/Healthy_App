// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MealDao? _mealDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `meal` (`ingredients` TEXT, `steps` TEXT, `type` TEXT NOT NULL, `id` INTEGER, `name` TEXT, `iconPath` TEXT, `author` TEXT, `description` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MealDao get mealDAO {
    return _mealDAOInstance ??= _$MealDao(database, changeListener);
  }
}

class _$MealDao extends MealDao {
  _$MealDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _mealModelInsertionAdapter = InsertionAdapter(
            database,
            'meal',
            (MealModel item) => <String, Object?>{
                  'ingredients': item.ingredientsJson,
                  'steps': item.stepsJson,
                  'type': item.typeString,
                  'id': item.id,
                  'name': item.name,
                  'iconPath': item.iconPath,
                  'author': item.author,
                  'description': item.description
                }),
        _mealModelDeletionAdapter = DeletionAdapter(
            database,
            'meal',
            ['id'],
            (MealModel item) => <String, Object?>{
                  'ingredients': item.ingredientsJson,
                  'steps': item.stepsJson,
                  'type': item.typeString,
                  'id': item.id,
                  'name': item.name,
                  'iconPath': item.iconPath,
                  'author': item.author,
                  'description': item.description
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MealModel> _mealModelInsertionAdapter;

  final DeletionAdapter<MealModel> _mealModelDeletionAdapter;

  @override
  Future<List<MealModel>> getMeals() async {
    return _queryAdapter.queryList('SELECT * FROM meal',
        mapper: (Map<String, Object?> row) => MealModel(
            id: row['id'] as int?,
            name: row['name'] as String?,
            iconPath: row['iconPath'] as String?,
            author: row['author'] as String?,
            description: row['description'] as String?,
            ingredientsJson: row['ingredients'] as String?,
            stepsJson: row['steps'] as String?,
            typeString: row['type'] as String));
  }

  @override
  Future<MealModel?> getMeal(int id) async {
    return _queryAdapter.query('SELECT * FROM meal WHERE id= ?1',
        mapper: (Map<String, Object?> row) => MealModel(
            id: row['id'] as int?,
            name: row['name'] as String?,
            iconPath: row['iconPath'] as String?,
            author: row['author'] as String?,
            description: row['description'] as String?,
            ingredientsJson: row['ingredients'] as String?,
            stepsJson: row['steps'] as String?,
            typeString: row['type'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertMeal(MealModel meal) async {
    await _mealModelInsertionAdapter.insert(meal, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMeal(MealModel meal) async {
    await _mealModelDeletionAdapter.delete(meal);
  }
}
