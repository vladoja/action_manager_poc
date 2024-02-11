part of 'oso_filtered_bloc.dart';

class OsoFilteredState extends Equatable {
  final List<OsoEntity> osoFiltered;

  const OsoFilteredState({required this.osoFiltered});

  factory OsoFilteredState.initial() {
    return const OsoFilteredState(osoFiltered: []);
  }

  @override
  List<Object> get props => [osoFiltered];

  @override
  String toString() => 'OsoFilteredState(osoFiltered: $osoFiltered)';

  OsoFilteredState copyWith({
    List<OsoEntity>? osoFiltered,
  }) {
    return OsoFilteredState(
      osoFiltered: osoFiltered ?? this.osoFiltered,
    );
  }
}
