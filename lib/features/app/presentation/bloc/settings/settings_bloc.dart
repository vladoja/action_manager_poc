import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState.initial()) {
    on<SetSettingsEvent>(_onSetSettingsEvent);
  }

  FutureOr<void> _onSetSettingsEvent(
      SetSettingsEvent event, Emitter<SettingsState> emit) {
    emit(state.copyWith(showTitlesInMainRail: event.showTitlesInMainRail));
  }
}
