part of 'personal_search_bloc.dart';

abstract class PersonalSearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SetPersonalSearchTerm extends PersonalSearchEvent {
  final String newSearchTerm;

  SetPersonalSearchTerm({required this.newSearchTerm});

  @override
  String toString() => 'SetPersonalSearchTerm(newSearchTerm: $newSearchTerm)';

  @override
  List<Object> get props => [newSearchTerm];
}
