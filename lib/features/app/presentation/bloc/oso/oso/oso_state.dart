part of 'oso_bloc.dart';

class OsoState extends Equatable {
  final List<OsoEntity> oso;

  const OsoState({required this.oso});

  factory OsoState.initial() {
    return const OsoState(oso: <OsoEntity>[...oso_zoznam_dummy]);
  }

  @override
  List<Object> get props => [oso];
}
