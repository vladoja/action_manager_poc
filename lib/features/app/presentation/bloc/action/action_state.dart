part of 'action_bloc.dart';

abstract class ActionState extends Equatable {
  final List<ActionEntity> actions;
  const ActionState({required this.actions});

  @override
  List<Object> get props => [actions];
}

class ActionLoading extends ActionState {
  ActionLoading() : super(actions: []);
}

class ActionInitial extends ActionState {
  ActionInitial() : super(actions: [...actions_data_temp]);
}

class ActionDone extends ActionState {
  const ActionDone(List<ActionEntity> actions) : super(actions: actions);
}
