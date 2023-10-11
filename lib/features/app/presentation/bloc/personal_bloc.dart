import 'dart:async';

import 'package:action_manager_poc/features/app/domain/entities/person.dart';
import 'package:action_manager_poc/temp/dummy_personal.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'personal_event.dart';
part 'personal_state.dart';

class PersonalBloc extends Bloc<PersonalEvent, PersonalState> {
  PersonalBloc() : super(PersonalLoading()) {
    on<GetPersonal>(_onGetPersonal);
    on<RemovePersonFromPersonal>(_onRemovePersonFromPersonal);
    on<CreatePersonInPersonal>(_onCreatePersonInPersonal);
    on<UpdatePersonInPersonal>(_onEditPersonInPersonal);
  }

  @override
  onChange(Change<PersonalState> change) {
    super.onChange(change);
    // WATCH state change
    // debugPrint(change.toString());
  }

  FutureOr<void> _onGetPersonal(
      GetPersonal event, Emitter<PersonalState> emit) {
    var personal = [...personal_data_temp];
    emit(PersonalDone(personal));
  }

  FutureOr<void> _onRemovePersonFromPersonal(
      RemovePersonFromPersonal event, Emitter<PersonalState> emit) {
    List<PersonEntity> persons;
    if (state.persons == null) {
      throw 'Personal is null';
    }
    if (state.persons!.isEmpty) {
      throw 'Personal is empty';
    }
    persons = <PersonEntity>[...state.persons!].toList();
    persons.removeWhere((element) => element.id == event.person.id);
    emit(PersonalDone(persons));
  }

  FutureOr<void> _onCreatePersonInPersonal(
      CreatePersonInPersonal event, Emitter<PersonalState> emit) {
    List<PersonEntity> persons = [];
    if (state.persons != null && state.persons!.isNotEmpty) {
      persons.addAll(state.persons!.toList());
    }
    persons.add(event.person);
    emit(PersonalDone(persons));
  }

  FutureOr<void> _onEditPersonInPersonal(
      UpdatePersonInPersonal event, Emitter<PersonalState> emit) {
    List<PersonEntity> persons = <PersonEntity>[...state.persons!].toList();
    persons.removeWhere((element) => element.id == event.person.id);
    persons.add(event.person);
    emit(PersonalDone(persons));
  }
}
