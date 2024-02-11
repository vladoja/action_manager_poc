part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final bool showTitlesInMainRail;

  const SettingsState({required this.showTitlesInMainRail});

  factory SettingsState.initial() {
    return const SettingsState(showTitlesInMainRail: false);
  }

  @override
  List<Object> get props => [showTitlesInMainRail];

  SettingsState copyWith({
    bool? showTitlesInMainRail,
  }) {
    return SettingsState(
      showTitlesInMainRail: showTitlesInMainRail ?? this.showTitlesInMainRail,
    );
  }
}
