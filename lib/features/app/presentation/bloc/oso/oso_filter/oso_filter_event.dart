part of 'oso_filter_bloc.dart';

abstract class OsoFilterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SetOsoSearchTerm extends OsoFilterEvent {
  final String searchTerm;
  SetOsoSearchTerm({required this.searchTerm});

  @override
  String toString() => 'SetOsoSearchTerm(searchTerm: $searchTerm)';

  @override
  List<Object> get props => [searchTerm];
}
