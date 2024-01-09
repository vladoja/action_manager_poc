import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../temp/dummy_osoby.dart';
import '../../../../domain/entities/osoba/osoba.dart';

part 'osoby_event.dart';
part 'osoby_state.dart';

class OsobyBloc extends Bloc<OsobyEvent, OsobyState> {
  OsobyBloc() : super(OsobyState(osoby: zoznamy_osoby_dummy)) {
    on<GetOsoby>(_onGetOsoby);
  }

  FutureOr<void> _onGetOsoby(GetOsoby event, Emitter<OsobyState> emit) {
    var osoby = [...zoznamy_osoby_dummy];
    emit(OsobyState(osoby: osoby));
  }
}
