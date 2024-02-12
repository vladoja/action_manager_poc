import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState.initial()) {
    on<SetSettingsEvent>(_onSetSettingsEvent);
    on<SwitchShowTitlesInMainRailEvent>(_onSwitchShowTitlesInMainRailEvent);
  }

  FutureOr<void> _onSetSettingsEvent(
      SetSettingsEvent event, Emitter<SettingsState> emit) {
    emit(state.copyWith(showTitlesInMainRail: event.showTitlesInMainRail));
  }

  FutureOr<void> _onSwitchShowTitlesInMainRailEvent(
      SwitchShowTitlesInMainRailEvent event, Emitter<SettingsState> emit) {
    emit(state.copyWith(showTitlesInMainRail: !state.showTitlesInMainRail));
  }
}
