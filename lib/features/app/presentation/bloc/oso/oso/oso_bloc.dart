import 'dart:async';

import '../../../../../../temp/dummy_oso.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/oso/oso.dart';

part 'oso_event.dart';
part 'oso_state.dart';

class OsoBloc extends Bloc<OsoEvent, OsoState> {
  OsoBloc() : super(OsoState.initial()) {
    on<GetOSO>(_onGetOSO);
  }

  FutureOr<void> _onGetOSO(GetOSO event, Emitter<OsoState> emit) {}
}
