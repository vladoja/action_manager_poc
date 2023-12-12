part of 'personal_bloc.dart';

abstract class PersonalState extends Equatable {
  final List<PersonEntity> persons;
  const PersonalState({required this.persons});

  @override
  List<Object> get props => [persons];
}

class PersonalLoading extends PersonalState {
  PersonalLoading() : super(persons: <PersonEntity>[]);
}

class PersonalDone extends PersonalState {
  const PersonalDone(List<PersonEntity> persons) : super(persons: persons);
}
