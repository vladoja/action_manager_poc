import 'package:action_manager_poc/features/app/data/data_sources/local/DAO/person_dao.dart';
import 'package:action_manager_poc/features/app/data/models/person.dart';
import 'package:floor/floor.dart';
// Library prefix for generated part g.dart. Otherwise erros.
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [PersonModel])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}
