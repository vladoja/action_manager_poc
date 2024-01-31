import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../temp/dummy_oso.dart';
import '../../../../domain/entities/oso/oso.dart';

part 'oso_event.dart';
part 'oso_state.dart';

class OsoBloc extends Bloc<OsoEvent, OsoState> {
  OsoBloc() : super(OsoState.initial()) {
    on<GetOSO>(_onGetOSO);
    on<CreateOsoInOso>(_onCreateOsoInOso);
  }

  FutureOr<void> _onGetOSO(GetOSO event, Emitter<OsoState> emit) {}

  FutureOr<void> _onCreateOsoInOso(
      CreateOsoInOso event, Emitter<OsoState> emit) {
    List<OsoEntity> oso = [];
    if (state.oso.isNotEmpty) {
      oso.addAll(state.oso.toList());
    }
    oso.add(event.osoba);
    emit(OsoState(oso: oso));
  }
}
