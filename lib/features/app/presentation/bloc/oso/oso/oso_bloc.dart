import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/oso/oso.dart';

part 'oso_event.dart';
part 'oso_state.dart';

class OsoBloc extends Bloc<OsoEvent, OsoState> {
  OsoBloc() : super(OsoState.initial()) {
    on<OsoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
