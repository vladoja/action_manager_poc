part of 'oso_filtered_bloc.dart';

abstract class OsoFilteredEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CalculateFilteredOsoEvent extends OsoFilteredEvent {
  final List<OsoEntity> osoFiltered;
  final String searchedTerm;

  CalculateFilteredOsoEvent(
      {required this.osoFiltered, this.searchedTerm = ''});

  @override
  List<Object> get props => [osoFiltered, searchedTerm];

  @override
  String toString() =>
      'CalculateFilteredOsoEvent(osoFiltered: $osoFiltered, searchedTerm: $searchedTerm)';
}
