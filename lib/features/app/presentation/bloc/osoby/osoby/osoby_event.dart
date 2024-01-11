part of 'osoby_bloc.dart';

abstract class OsobyEvent {
  const OsobyEvent();
}

class GetOsoby extends OsobyEvent {
  const GetOsoby();
}

class CreateOsobaInOsoby extends OsobyEvent {
  final OsobaEntity osoba;
  const CreateOsobaInOsoby(this.osoba);
}

class UpdateOsobaInOsoby extends OsobyEvent {
  final OsobaEntity osoba;
  const UpdateOsobaInOsoby(this.osoba);
}
