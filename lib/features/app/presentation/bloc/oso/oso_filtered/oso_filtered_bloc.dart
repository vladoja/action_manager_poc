import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/oso/oso.dart';

part 'oso_filtered_event.dart';
part 'oso_filtered_state.dart';

class OsoFilteredBloc extends Bloc<OsoFilteredEvent, OsoFilteredState> {
  final List<OsoEntity> initialOso;
  OsoFilteredBloc({required this.initialOso})
      : super(OsoFilteredState(osoFiltered: initialOso)) {
    on<CalculateFilteredOsoEvent>(_onCalculateFilteredOsoEvent);
  }

  FutureOr<void> _onCalculateFilteredOsoEvent(
      CalculateFilteredOsoEvent event, Emitter<OsoFilteredState> emit) {
    List<OsoEntity> filteredOso =
        calculateFilteredOso(event.osoFiltered, event.searchedTerm);
    emit(state.copyWith(osoFiltered: filteredOso));
  }
}

List<OsoEntity> calculateFilteredOso(List<OsoEntity> osoby, String searchTerm) {
  List<OsoEntity> filteredOso = [...osoby];
  if (searchTerm.isNotEmpty) {
    final String searchTermLowerCase = searchTerm.toLowerCase();
    filteredOso = filteredOso
        .where((OsoEntity person) =>
            (person.cisloPeciatky != null &&
                person.cisloPeciatky!.contains(searchTermLowerCase)) ||
            person.priezvisko.toLowerCase().contains(searchTermLowerCase) ||
            person.meno.toLowerCase().contains(searchTermLowerCase))
        .toList();
  }
  return filteredOso;
}
