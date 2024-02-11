part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {}

class SetSettingsEvent extends SettingsEvent {
  final bool showTitlesInMainRail;

  SetSettingsEvent({required this.showTitlesInMainRail});

  @override
  List<Object> get props => [showTitlesInMainRail];
}
