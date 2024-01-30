part of 'oso_bloc.dart';

class OsoState extends Equatable {
  final List<OsoEntity> oso;

  const OsoState({required this.oso});

  factory OsoState.initial() {
    return const OsoState(oso: <OsoEntity>[]);
  }

  @override
  List<Object> get props => [oso];
}
