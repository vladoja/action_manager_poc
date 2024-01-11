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
    on<CreateOsobaInOsoby>(_onCreateOsobaInOsoby);
    on<UpdateOsobaInOsoby>(_onUpdateOsobaInOsoby);
  }

  FutureOr<void> _onGetOsoby(GetOsoby event, Emitter<OsobyState> emit) {
    var osoby = [...zoznamy_osoby_dummy];
    emit(OsobyState(osoby: osoby));
  }

  FutureOr<void> _onCreateOsobaInOsoby(
      CreateOsobaInOsoby event, Emitter<OsobyState> emit) {
    List<OsobaEntity> osoby = [];
    if (state.osoby.isNotEmpty) {
      osoby.addAll(state.osoby.toList());
    }
    osoby.add(event.osoba);
    emit(OsobyState(osoby: osoby));
  }

  FutureOr<void> _onUpdateOsobaInOsoby(
      UpdateOsobaInOsoby event, Emitter<OsobyState> emit) {
    List<OsobaEntity> osoby = <OsobaEntity>[...state.osoby].toList();
    osoby.removeWhere(
      (element) => element.id == event.osoba.id,
    );
    osoby.add(event.osoba);
    emit(OsobyState(osoby: osoby));
  }
}
