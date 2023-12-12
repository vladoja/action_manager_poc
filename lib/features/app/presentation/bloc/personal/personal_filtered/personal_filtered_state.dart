part of 'personal_filtered_bloc.dart';

class PersonalFilteredState extends Equatable {
  final List<PersonEntity> filteredPersonal;

  const PersonalFilteredState({required this.filteredPersonal});

  factory PersonalFilteredState.initial() {
    return const PersonalFilteredState(filteredPersonal: []);
  }

  @override
  List<Object> get props => [filteredPersonal];

  @override
  String toString() =>
      'PersonalFilteredState(filteredPersonal: $filteredPersonal)';

  PersonalFilteredState copyWith({
    List<PersonEntity>? filteredPersonal,
  }) {
    return PersonalFilteredState(
      filteredPersonal: filteredPersonal ?? this.filteredPersonal,
    );
  }
}
