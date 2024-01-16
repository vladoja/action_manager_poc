import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../temp/dummy_ziadosti_o_skusku.dart';
import '../../../domain/entities/exam/ExamRequest.dart';

part 'exam_requests_event.dart';
part 'exam_requests_state.dart';

class ExamRequestsBloc extends Bloc<ExamRequestsEvent, ExamRequestsState> {
  ExamRequestsBloc()
      : super(ExamRequestsState(examRequests: exam_requests_data_temp)) {
    on<ExamRequestsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
