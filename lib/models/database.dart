import 'package:hive/hive.dart';

part 'database.g.dart';

@HiveType()
class Database{

  @HiveField(0)
  String lastWords; // Var for patients' details

Database(this.lastWords);

}