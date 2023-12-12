import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/person/person.dart';

part 'personal_filtered_event.dart';
part 'personal_filtered_state.dart';

class PersonalFilteredBloc
    extends Bloc<PersonalFilteredEvent, PersonalFilteredState> {
  final List<PersonEntity> initialPersons;
  PersonalFilteredBloc({required this.initialPersons})
      : super(PersonalFilteredState(filteredPersonal: initialPersons)) {
    on<CalculateFilteredPersonalEvent>((event, emit) {
      emit(state.copyWith(filteredPersonal: event.filteredPersonal));
    });
  }

  static List<PersonEntity> setFilteredPersonal(
      List<PersonEntity> persons, String searchTerm) {
    List<PersonEntity> _filteredPerson = persons;
    if (searchTerm.isNotEmpty && searchTerm.length > 0) {
      final String searchTermLowerCase = searchTerm.toLowerCase();
      _filteredPerson = _filteredPerson
          .where((PersonEntity person) =>
              person.firstName.toLowerCase().contains(searchTermLowerCase) ||
              person.lastName.toLowerCase().contains(searchTermLowerCase))
          .toList();
    }
    return _filteredPerson;
  }
}
