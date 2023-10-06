import 'package:action_manager_poc/features/app/data/models/person.dart';
import 'package:floor/floor.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM person')
  Future<List<PersonModel>> getPersons();
}
