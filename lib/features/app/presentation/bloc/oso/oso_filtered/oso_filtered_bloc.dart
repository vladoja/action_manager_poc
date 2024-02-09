import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/oso/oso.dart';

part 'oso_filtered_event.dart';
part 'oso_filtered_state.dart';

class OsoFilteredBloc extends Bloc<OsoFilteredEvent, OsoFilteredState> {
  OsoFilteredBloc() : super(OsoFilteredState.initial()) {
    on<OsoFilteredEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
