import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../temp/dummy_actions.dart';
import '../../../domain/entities/action.dart';
import '../../../domain/entities/person/person.dart';

part 'action_event.dart';
part 'action_state.dart';

class ActionBloc extends Bloc<ActionEvent, ActionState> {
  ActionBloc() : super(ActionInitial()) {
    // ActionBloc() : super(ActionLoading()) {
    on<GetActionsEvent>(_onGetActionsEvent);
    on<CreateActionEvent>(_onCreateActionEvent);
    on<UpdateActionEvent>(_updateActionEvent);
    on<RemoveActionEvent>(_removeActionEvent);
    on<AddPersonalToActionEvent>(_onAddPersonalToActionEvent);
    on<RemovePersonalFromActionEvent>(_onRemovePersonalFromActionEvent);
    // add(GetActionsEvent());
  }

  FutureOr<void> _onGetActionsEvent(
      GetActionsEvent event, Emitter<ActionState> emit) {
    // Get Actions from some service
    List<ActionEntity> actions = [...actions_data_temp];
    emit(ActionDone(actions));
  }

  FutureOr<void> _onCreateActionEvent(
      CreateActionEvent event, Emitter<ActionState> emit) {
    ActionEntity newAction = event.action;
    List<ActionEntity> actions = [...state.actions];
    actions.add(newAction);
    emit(ActionDone(actions));
  }

  FutureOr<void> _updateActionEvent(
      UpdateActionEvent event, Emitter<ActionState> emit) {
    ActionEntity actionToUpdate = event.action;
    List<ActionEntity> actions = [...state.actions]
        .where((element) => element.id != actionToUpdate.id)
        .toList();
    actions.add(actionToUpdate);
    emit(ActionDone(actions));
  }

  FutureOr<void> _removeActionEvent(
      RemoveActionEvent event, Emitter<ActionState> emit) {
    ActionEntity actionToRemove = event.action;
    List<ActionEntity> actions = [...state.actions]
        .where((element) => element.id != actionToRemove.id)
        .toList();
    emit(ActionDone(actions));
  }

  FutureOr<void> _onAddPersonalToActionEvent(
      AddPersonalToActionEvent event, Emitter<ActionState> emit) {
    List<PersonEntity> personsToAdd = event.persons;
    List<int> personsToAddIds = personsToAdd.map((e) => e.id).toList();
    ActionEntity updatedAction = event.action;
    List<int> personsIds = [...updatedAction.personal];

    personsIds.addAll(personsToAddIds);

    updatedAction = updatedAction.copyWith(personal: personsIds);
    List<ActionEntity> updateActionList =
        _updateActionList(state.actions, updatedAction);
    emit(ActionDone(updateActionList));
  }

  FutureOr<void> _onRemovePersonalFromActionEvent(
      RemovePersonalFromActionEvent event, Emitter<ActionState> emit) {
    PersonEntity personToRemove = event.person;
    ActionEntity updatedAction = event.action;
    List<int> personsIds = [...updatedAction.personal];
    personsIds =
        personsIds.where((element) => element != personToRemove.id).toList();
    updatedAction = updatedAction.copyWith(personal: personsIds);
    List<ActionEntity> updateActionList =
        _updateActionList(state.actions, updatedAction);
    emit(ActionDone(updateActionList));
  }

  List<ActionEntity> _updateActionList(
      List<ActionEntity> actions, ActionEntity updatedAction) {
    List<ActionEntity> newActionsList = [...actions]
        .where((element) => element.id != updatedAction.id)
        .toList();
    newActionsList.add(updatedAction);
    return newActionsList;
  }
}
