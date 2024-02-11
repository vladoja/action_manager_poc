import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'oso_filter_event.dart';
part 'oso_filter_state.dart';

class OsoFilterBloc extends Bloc<OsoFilterEvent, OsoFilterState> {
  OsoFilterBloc() : super(OsoFilterState.initial()) {
    on<SetOsoSearchTerm>(_onSetOsoSearchTerm);
  }

  FutureOr<void> _onSetOsoSearchTerm(
      SetOsoSearchTerm event, Emitter<OsoFilterState> emit) {
    emit(state.copyWith(searchTerm: event.searchTerm));
  }
}
