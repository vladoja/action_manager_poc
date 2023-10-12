import 'dart:async';

import 'package:action_manager_poc/features/app/domain/entities/action.dart';
import 'package:action_manager_poc/temp/dummy_actions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'action_event.dart';
part 'action_state.dart';

class ActionBloc extends Bloc<ActionEvent, ActionState> {
  ActionBloc() : super(ActionLoading()) {
    on<GetActionsEvent>(_onGetActionsEvent);
  }

  FutureOr<void> _onGetActionsEvent(
      GetActionsEvent event, Emitter<ActionState> emit) {
    // Get Actions from some service
    List<ActionEntity> actions = [...actions_data_temp];
    emit(ActionDone(actions));
  }
}
