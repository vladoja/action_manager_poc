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
    emit(state.copyWith(osoFiltered: event.osoFiltered));
  }
}
