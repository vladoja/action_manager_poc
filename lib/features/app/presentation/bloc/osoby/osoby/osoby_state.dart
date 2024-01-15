part of 'osoby_bloc.dart';

class OsobyState extends Equatable {
  final List<OsobaEntity> osoby;
  const OsobyState({required this.osoby});

  factory OsobyState.initial() {
    return const OsobyState(osoby: <OsobaEntity>[]);
  }

  @override
  List<Object> get props => [osoby];
}
