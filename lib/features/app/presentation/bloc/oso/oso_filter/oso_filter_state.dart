part of 'oso_filter_bloc.dart';

class OsoFilterState extends Equatable {
  final String searchTerm;

  const OsoFilterState({required this.searchTerm});

  factory OsoFilterState.initial() {
    return const OsoFilterState(searchTerm: '');
  }

  @override
  List<Object?> get props => [searchTerm];

  OsoFilterState copyWith({
    String? searchTerm,
  }) {
    return OsoFilterState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
