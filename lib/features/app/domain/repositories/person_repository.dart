import 'package:action_manager_poc/core/resources/data_state.dart';
import 'package:action_manager_poc/features/app/domain/entities/person/person.dart';

abstract class PersonRepository {
  Future<DataState<List<PersonEntity>>> getPersons();
}
