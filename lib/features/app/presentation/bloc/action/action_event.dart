part of 'action_bloc.dart';

abstract class ActionEvent {
  const ActionEvent();
}

class GetActionsEvent extends ActionEvent {}
