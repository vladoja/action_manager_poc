part of 'action_bloc.dart';

abstract class ActionEvent {
  const ActionEvent();
}

class GetActionsEvent extends ActionEvent {}

class CreateActionEvent extends ActionEvent {
  final ActionEntity action;
  CreateActionEvent(this.action);
}

class UpdateActionEvent extends ActionEvent {
  final ActionEntity action;
  UpdateActionEvent(this.action);
}
