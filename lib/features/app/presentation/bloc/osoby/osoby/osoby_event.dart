part of 'osoby_bloc.dart';

abstract class OsobyEvent {
  const OsobyEvent();
}

class GetOsoby extends OsobyEvent {
  const GetOsoby();
}
