part of 'oso_bloc.dart';

abstract class OsoEvent {
  const OsoEvent();
}

class GetOSO extends OsoEvent {
  const GetOSO();
}
