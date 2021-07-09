import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

class AppDatabase {
  // Singleton instance
  static final AppDatabase _singleton = AppDatabase._();

  // Singleton accessor
  static AppDatabase get instance => _singleton;

  // Completer is used for transforming synchronous code into asynchronous code.
  late Completer<Database> _dbOpenCompleter;

  // A private constructor. Allows us to create instances of AppDatabase
  // only from within the AppDatabase class itself.
  AppDatabase._();

  // Sembast database object

  // Database object accessor
  Future<Database> get database async {
    // If completer is null, AppDatabaseClass is newly instantiated, so database is not yet opened
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      // Calling _openDatabase will also complete the completer with database instance
      _openDatabase();
    }
    return _dbOpenCompleter.future;
  }

  Future _openDatabase() async {

    //Completer<Database> _dbOpenCompleter;
    
    final dbPath = 'app_database';

    final database = await databaseFactoryIo.openDatabase(dbPath);
    // Any code awaiting the Completer's future will now start executing
    _dbOpenCompleter.complete(database);
  }

  Future get openDatabase async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
     return await databaseFactoryIo
      .openDatabase(join(appDocDirectory.path, 'wallpaper', 'app_database.db'));
  }
}
