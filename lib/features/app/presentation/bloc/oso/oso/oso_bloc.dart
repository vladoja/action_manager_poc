import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/utils/action_utils.dart';
import '../../../../../../temp/dummy_oso.dart';
import '../../../../domain/entities/oso/oso.dart';

part 'oso_event.dart';
part 'oso_state.dart';

class OsoBloc extends Bloc<OsoEvent, OsoState> {
  OsoBloc() : super(OsoState.initial()) {
    on<GetOSO>(_onGetOSO);
    on<CreateOsoInOso>(_onCreateOsoInOso);
    on<UpdateOsoInOso>(_onUpdateOsoInOso);
    on<RemoveOsoInOso>(_onRemoveOsoInOso);
    on<RecalculateKritickeDniEvent>(_onRecalculateKritickeDniEvent);
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

  FutureOr<void> _onUpdateOsoInOso(
      UpdateOsoInOso event, Emitter<OsoState> emit) {
    List<OsoEntity> oso = [];
    OsoEntity osoToUpdate = event.osoba;
    oso.addAll(state.oso);
    oso.removeWhere((element) => element.id == osoToUpdate.id);
    oso.add(osoToUpdate);
    emit(OsoState(oso: oso));
  }

  FutureOr<void> _onRemoveOsoInOso(
      RemoveOsoInOso event, Emitter<OsoState> emit) {
    List<OsoEntity> oso = [];
    OsoEntity osoToUpdate = event.osoba;
    oso.addAll(state.oso);
    oso.removeWhere((element) => element.id == osoToUpdate.id);
    emit(OsoState(oso: oso));
  }

  FutureOr<void> _onRecalculateKritickeDniEvent(
      RecalculateKritickeDniEvent event, Emitter<OsoState> emit) {
    List<OsoEntity> oso = [];
    final String currentDate = event.currentDate;
    for (OsoEntity osoba in state.oso) {
      int? kritickeDniRozdiel = getDayDifference(
          currentDate, osoba.platnostOsvedceniaDatum,
          date2Format: 'yyyy/MM/dd');
      // debugPrint(
      //     'oso:${osoba.id} getDayDifference "$currentDate" vs "${osoba.platnostOsvedceniaDatum}". Rozdiel:$kritickeDniRozdiel');
      oso.add(osoba.copyWith(
        zostavajuceDniPlatnosti: () => kritickeDniRozdiel,
      ));
    }
    emit(OsoState(oso: oso));
  }
}
