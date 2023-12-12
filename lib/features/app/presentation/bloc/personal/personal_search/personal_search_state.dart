part of 'personal_search_bloc.dart';

class PersonalSearchState extends Equatable {
  final String searchTerm;

  const PersonalSearchState({required this.searchTerm});

  factory PersonalSearchState.initial() {
    return const PersonalSearchState(searchTerm: '');
  }

  @override
  List<Object> get props => [searchTerm];

  PersonalSearchState copyWith({
    String? searchTerm,
  }) {
    return PersonalSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  String toString() => 'PersonalSearchState(searchTerm: $searchTerm)';

  Map<String, dynamic> toMap() {
    return {
      'searchTerm': searchTerm,
    };
  }

  factory PersonalSearchState.fromMap(Map<String, dynamic> map) {
    return PersonalSearchState(
      searchTerm: map['searchTerm'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonalSearchState.fromJson(String source) =>
      PersonalSearchState.fromMap(json.decode(source));
}
