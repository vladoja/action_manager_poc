import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'personal_search_event.dart';
part 'personal_search_state.dart';

class PersonalSearchBloc
    extends Bloc<PersonalSearchEvent, PersonalSearchState> {
  PersonalSearchBloc() : super(PersonalSearchState.initial()) {
    on<SetPersonalSearchTerm>((event, emit) {
      emit(state.copyWith(searchTerm: event.newSearchTerm));
    });
  }
}
