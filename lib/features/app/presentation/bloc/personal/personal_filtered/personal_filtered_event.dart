part of 'personal_filtered_bloc.dart';

abstract class PersonalFilteredEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CalculateFilteredPersonalEvent extends PersonalFilteredEvent {
  final List<PersonEntity> filteredPersonal;

  CalculateFilteredPersonalEvent({required this.filteredPersonal});

  @override
  List<Object> get props => [filteredPersonal];

  @override
  String toString() =>
      'CalculateFilteredPersonalEvent(filteredPersonal: $filteredPersonal)';
}
