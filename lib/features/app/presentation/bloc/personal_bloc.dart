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
  }

  FutureOr<void> _onGetPersonal(
      GetPersonal event, Emitter<PersonalState> emit) {
    var personal = [...personal_data_temp];
    emit(PersonalDone(personal));
  }
}
