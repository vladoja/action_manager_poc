part of 'oso_bloc.dart';

abstract class OsoEvent {
  const OsoEvent();
}

class GetOSO extends OsoEvent {
  const GetOSO();
}

class CreateOsoInOso extends OsoEvent {
  final OsoEntity osoba;
  const CreateOsoInOso(this.osoba);
}

class UpdateOsoInOso extends OsoEvent {
  final OsoEntity osoba;
  const UpdateOsoInOso(this.osoba);
}
