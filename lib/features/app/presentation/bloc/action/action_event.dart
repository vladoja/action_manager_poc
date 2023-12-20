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

class RemoveActionEvent extends ActionEvent {
  final ActionEntity action;
  RemoveActionEvent(this.action);
}

class AddPersonalToActionEvent extends ActionEvent {
  final ActionEntity action;
  final List<PersonEntity> persons;

  AddPersonalToActionEvent({required this.action, required this.persons});
}

class RemovePersonalFromActionEvent extends ActionEvent {
  final ActionEntity action;
  final PersonEntity person;

  RemovePersonalFromActionEvent({required this.action, required this.person});
}
