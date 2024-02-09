part of 'oso_filtered_bloc.dart';

abstract class OsoFilteredEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CalculateFilteredOsoEvent extends OsoFilteredEvent {
  final List<OsoEntity> osoFiltered;

  CalculateFilteredOsoEvent({required this.osoFiltered});

  @override
  List<Object> get props => [osoFiltered];

  @override
  String toString() => 'CalculateFilteredOsoEvent(osoFiltered: $osoFiltered)';
}
