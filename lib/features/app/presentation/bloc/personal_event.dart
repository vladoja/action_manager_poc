part of 'personal_bloc.dart';

// abstract class PersonalEvent extends Equatable {
abstract class PersonalEvent {
  const PersonalEvent();
}

class GetPersonal extends PersonalEvent {
  const GetPersonal();
}

class RemovePersonFromPersonal extends PersonalEvent {
  final PersonEntity person;
  const RemovePersonFromPersonal(this.person);
}

class CreatePersonInPersonal extends PersonalEvent {
  final PersonEntity person;
  const CreatePersonInPersonal(this.person);
}
