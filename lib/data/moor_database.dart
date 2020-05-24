import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class MoorDatabase extends Table{
  // the last pair of '()' at the end of every line of code is the short of 'call()'
  IntColumn get id => integer().autoIncrement()(); //autoIncrement automatically sets this to primary key. Initializing. ID of the patient
  TextColumn get patientDetails => text()(); // name of the patient
  TextColumn get diagnosis => text()(); //diagnosis
  TextColumn get prescription => text()(); // prescription
  TextColumn get advice => text()(); // advice
}

// defining database class
@UseMoor(tables: [MoorDatabase])
class AppDatabase extends _$AppDatabase{
  // location of the database folder
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'db.sqlite',
      logStatements: true)
  );

  @override
  int get schemaVersion => 1;

  //Creating Queries
  Future<List<MoorDatabaseData>> getAllMoorDB() => select(moorDatabase).get(); // returns a future
  Stream<List<MoorDatabaseData>> watchAllMoorDB() => select(moorDatabase).watch(); // observes and gets new values from the table every time value is added
  Future insertMoorDB(MoorDatabaseData moorDatabaseData) => into(moorDatabase).insert(moorDatabaseData); // adds entries
  Future updateMoorDB(MoorDatabaseData moorDatabaseData) => update(moorDatabase).replace(moorDatabaseData); // updates entries
  Future deleteMoorDB(MoorDatabaseData moorDatabaseData) => delete(moorDatabase).delete(moorDatabaseData); // deletes entries
}