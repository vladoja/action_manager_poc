import 'package:action_manager_poc/features/app/data/data_sources/local/app_database.dart';
import 'package:action_manager_poc/features/app/domain/entities/person/person.dart';
import 'package:action_manager_poc/core/resources/data_state.dart';
import 'package:action_manager_poc/features/app/domain/repositories/person_repository.dart';

class PersonRepositoryImpl extends PersonRepository {
  final AppDatabase _appDatabase;

  PersonRepositoryImpl(this._appDatabase);

  @override
  Future<DataState<List<PersonEntity>>> getPersons() async {
    try {
      List<PersonEntity> persons = await _appDatabase.personDao.getPersons();
      return DataSuccess(persons);
    } on Exception catch (e) {
      return DataFailed(e);
    }
  }
}
