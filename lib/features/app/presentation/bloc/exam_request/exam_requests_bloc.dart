import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:action_manager_poc/features/app/domain/entities/exam/ExamRequest.dart';

part 'exam_requests_event.dart';
part 'exam_requests_state.dart';

class ExamRequestsBloc extends Bloc<ExamRequestsEvent, ExamRequestsState> {
  ExamRequestsBloc() : super(ExamRequestsState.initial()) {
    on<ExamRequestsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
